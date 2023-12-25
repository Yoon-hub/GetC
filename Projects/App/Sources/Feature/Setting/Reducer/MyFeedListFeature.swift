//
//  MyFeedListFeature.swift
//  GetC
//
//  Created by 윤제 on 12/19/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import NetworkKit
import GetCKit

import ComposableArchitecture

public struct MyFeedListFeature: Reducer {
    
    public struct State: Equatable {
        var feedList: [FeedItem] = []
        var isPresentedSheetView = false
        var selectFeedItem: FeedItem?
    }
    
    public enum Action {
        
        //MARK: - Inner Action
        case viewAppear
        case listItemTap(item: FeedItem)
        case listDeleteButtonTap
        case xButtonTap
        case naivgationBackButtonTap
        
        //MARK: - Inner State Change
        case requestMyFeedList
        case sheetViewDismissed
        
        // MARK: - Inner State Change
        case appendFeedList(feedItem: FeedItem)
    }
    
    @Dependency(\.apiService) var apiService
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewAppear:
                return .send(.requestMyFeedList)
            case .requestMyFeedList:
                state.feedList.removeAll()
                let userId = UserDefaultWrapper.userId
                let listParam = ListParameter(pageNumber: "0", pageSize: "20", order: "postId", flag: "2", keyword: userId)
                return .run { send in
                    let response = await apiService.apiRequset(type: FeedListDTO.self, router: FeedRouter.list(listParam: listParam))
                    
                    if let data = response.data {
                        for i in data.content {
                            let feedItem = FeedItem(id: i.postID, title: i.title, content: i.content, authorID: i.authorID, postedAt: formateDate(date: i.postedAt) , updatedAt: nil, view: i.view, postID: String(i.postID))
                            await send(.appendFeedList(feedItem: feedItem))
                        }
                    } else {
                        
                    }
                }
            case let .appendFeedList(feedItem):
                state.feedList.append(feedItem)
                return .none
            case .sheetViewDismissed:
                state.isPresentedSheetView = false
                return .none
            case .listItemTap(let item):
                state.isPresentedSheetView = true
                state.selectFeedItem = item
                return .none
            case .xButtonTap:
                return .send(.sheetViewDismissed)
            case .listDeleteButtonTap:
                let postId = state.selectFeedItem?.postID
                return .run { send in
                    let response = await apiService.apiRequset(type: DefaultDTO<DataClass>.self, router: FeedRouter.delete(postId: postId!))
                    await send(.sheetViewDismissed)
                    await send(.requestMyFeedList)
                }
            default:
                return .none
            }
        }
    }

    
    
}
