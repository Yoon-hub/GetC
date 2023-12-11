//
//  FeedCoordinator.swift
//  GetC
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture
import TCACoordinators

public struct FeedCoordinator: Reducer {
    
    public struct State: Equatable, IndexedRouterState {
        
        static let initialState = State(
            routes: [.root(.setFeedList(.init()), embedInNavigationView: true)]
        )
        
        public var routes: [Route<FeedScreen.State>]
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action:FeedScreen.Action)
        case updateRoutes([Route<FeedScreen.State>])
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .setFeedList(.addFeedButtonTap(let refresh))):
                state.routes.append(.cover(.setFeedAdd(.init(feedListRefresh: refresh)), embedInNavigationView: false, onDismiss: nil))
                return .none
            case .routeAction(_, action: .setFeedAdd(.xButtonTap)):
                state.routes.dismiss()
                return .none
            default:
                return .none
            }
        }
        .forEachRoute {
            FeedScreen()
        }
    }
        
}
