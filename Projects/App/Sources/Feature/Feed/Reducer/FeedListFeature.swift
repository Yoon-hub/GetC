//
//  FeedListFeature.swift
//  GetC
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import NetworkKit
import GetCKit

import ComposableArchitecture

public struct FeedListFeature: Reducer {
    
    public struct State: Equatable {
        
        var feedList: IdentifiedArrayOf<FeedItem> = []
        
        public static func == (lhs: FeedListFeature.State, rhs: FeedListFeature.State) -> Bool {
            if lhs.feedList == rhs.feedList {return true } else {
                return false
            }
        }
    }
    
    public enum Action {
        // MARK: - User Interaction
        case refresh
        case addFeedButtonTap(feedListRefresh: () -> Void)
        case settingButtonTap
        
        // MARK: - Inner Action
        case viewAppear
        case resetFeedList
        
        // MARK: - Inner State Change
        case appendFeedList(feedItem: FeedItem)
        case requestFeedList
    }
    
    @Dependency(\.apiService) var apiService
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewAppear:
                return .send(.requestFeedList)
            case .requestFeedList:
                state.feedList.removeAll()
                let listParam = ListParameter(pageNumber: "0", pageSize: "20", order: "postId", flag: "", keyword: "")
                return .run { send in
                    let response = await apiService.apiRequset(type: FeedListDTO.self, router: FeedRouter.list(listParam: listParam))
                    
                    if let data = response.data {
                        for i in data.content {
                            let feedItem = FeedItem(id: i.postID, title: i.title, content: i.content, authorID: i.authorID, postedAt: formateDate(date: i.postedAt) , updatedAt: nil, view: i.view)
                            await send(.appendFeedList(feedItem: feedItem))
                        }
                    } else {
                        
                    }
                }
            case let .appendFeedList(feedItem):
                state.feedList.append(feedItem)
                return .none
            case .resetFeedList:
                state.feedList.removeAll()
                return .none
            case .refresh:
                return .send(.requestFeedList)
            default:
                return .none
            }
        }
    }
    

    
}

extension FeedListFeature {
    public func formateDate(date: [Int]) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.year = date[0]
        dateComponents.month = date[1]
        dateComponents.day = date[2]
        dateComponents.hour = date[3]
        dateComponents.minute = date[4]
        
        if date.count >= 6 {
            dateComponents.second = date[5]
        }
       
        let calendar = Calendar.current
        
        return calendar.date(from: dateComponents)
    }
}
