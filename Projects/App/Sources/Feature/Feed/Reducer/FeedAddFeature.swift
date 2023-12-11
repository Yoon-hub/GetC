//
//  FeedAddFeature.swift
//  GetC
//
//  Created by 윤제 on 12/8/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import GetCKit
import NetworkKit

import ComposableArchitecture

public struct FeedAddFeature: Reducer {
    
    enum CompleteButton {
        case enable
        case disable
    }
    
    public struct State: Equatable {
        
        var feedText: String = ""
        var titleText: String = ""
        var contentText: String = ""
        var completeButtonState: CompleteButton = .disable
        var feedListRefresh: (() -> Void)
        var isShowAlert = false
        
        public static func == (lhs: FeedAddFeature.State, rhs: FeedAddFeature.State) -> Bool {
            lhs.feedText == rhs.feedText &&
                lhs.titleText == rhs.titleText &&
                lhs.contentText == rhs.contentText &&
                lhs.completeButtonState == rhs.completeButtonState
        }
    }
    
    public enum Action {
        // MARK: - User Define
        case xButtonTap
        case feedTextFieldEdit(text: String)
        case completeButotnTap
        
        // MARK: - Innert Action
        case postCreate
        
        // MARK: Inner State Change
        case makeTitleContent
        case checkEnableUpload
        case showAlert
        case hideAlert
    }
    
    @Dependency(\.apiService) var apiService
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .feedTextFieldEdit(let text):
                state.feedText = text
                return .send(.makeTitleContent)
            case .makeTitleContent:
                if let newlineRange = state.feedText.range(of: "\n") {
                    let newlineStart = newlineRange.lowerBound
                    let newlineEnd = newlineRange.upperBound
                    
                    state.titleText = String(state.feedText[..<newlineStart])
                    state.contentText = String(state.feedText[newlineEnd...])
                } else {
                    state.titleText = state.feedText
                    state.contentText = ""
                }
                
                return .send(.checkEnableUpload)
            case .completeButotnTap:
                if state.completeButtonState == .enable {
                    // 업로드할 곳
                    return .send(.postCreate)
                } else {
                    return .send(.xButtonTap)
                }
            case .checkEnableUpload:
                if state.titleText.count > 0 && state.contentText.count > 0 {
                    state.completeButtonState = .enable
                } else {
                    state.completeButtonState = .disable
                }
                return .none
            case .postCreate:
                let title = state.titleText
                let content = state.contentText
                    
                return .run { send in
                    let response = await apiService.apiRequset(type: PostCreateDTO.self, router: FeedRouter.create(authorId: UserDefaultWrapper.userId, title: title, Content: content, flag: "0"))
                    
                    if let data = response.data {
                        Utility.print("등록완료")
                        await send(.xButtonTap)
                    } else {
                        Utility.print("등록실패")
                    }
                }
            case .xButtonTap:
                state.feedListRefresh()
                return .none
            case .showAlert:
                state.isShowAlert = true
                return .none
            case .hideAlert:
                state.isShowAlert = false
                return .none
            default:
                return .none
            }
        }
    }
    
}
