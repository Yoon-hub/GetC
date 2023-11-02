//
//  AuthCoordinator.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/01.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture
import TCACoordinators

public struct AuthCoordinator: Reducer {
    
    init() {
        print("AuthCoordinator init")
    }
    
    public struct State: Equatable, IndexedRouterState {
        static let initialState = State(
            routes: [.root(.setOnBoarding(.init()))]
        )
        public var routes: [Route<AuthScreen.State>]
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action:AuthScreen.Action)
        case updateRoutes([Route<AuthScreen.State>])
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
                
            default:
                return .none
            }
        }

    }
}

