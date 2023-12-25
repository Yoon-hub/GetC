//
//  FeedDetailFeature.swift
//  GetC
//
//  Created by 윤제 on 12/19/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import ComposableArchitecture

public struct FeedDetailFeature: Reducer {
    
    public struct State: Equatable {
        let feedItem: FeedItem
        var heartState = false
        var commentText = ""
    }
    
    public enum Action {
        
        //MARK: - User Interaction
        case heartButtonTapped
        case commentTextDidChange(text: String)
        case navigationBackButtonTapped
    }
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case .heartButtonTapped:
                state.heartState.toggle()
                return .none
            case .commentTextDidChange(let text):
                state.commentText = text
                return .none
            default:
                return .none
            }
        }
    }
}
