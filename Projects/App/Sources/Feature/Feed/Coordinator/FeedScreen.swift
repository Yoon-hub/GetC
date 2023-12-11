//
//  FeedScreen.swift
//  GetC
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture
import TCACoordinators

public struct FeedScreen: Reducer {
    
    public enum State: Equatable {
        case setFeedList(FeedListFeature.State)
        case setFeedAdd(FeedAddFeature.State)
    }
    
    public enum Action {
        case setFeedList(FeedListFeature.Action)
        case setFeedAdd(FeedAddFeature.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.setFeedList, action: /Action.setFeedList) {
            FeedListFeature()
        }
        
        Scope(state: /State.setFeedAdd, action: /Action.setFeedAdd) {
            FeedAddFeature()
        }
    }
    
}
