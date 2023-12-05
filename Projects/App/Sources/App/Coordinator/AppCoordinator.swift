//
//  AppCoordinatorView.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/30.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture
import TCACoordinators
import GetCKit

public struct AppCoordinator: Reducer {
    
    init() {
        Utility.print("AppCoordinator init")
    }
    
    public struct State: Equatable, IndexedRouterState {
        static let initialState = State(
            routes: [.root(.splash(.init()), embedInNavigationView: true)]
        )
        public var routes: [Route<AppScreen.State>]
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: AppScreen.Action)
        case updateRoutes([Route<AppScreen.State>])
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .splash(._moveToAuth)):
                state.routes = [
                  .root(
                    .auth(.initialState)
                  , embedInNavigationView: true)
                ]
                return .none
            case .routeAction(_, action: .auth(.moveToFeed)):
                state.routes = [
                  .root(
                    .feed(.initialState)
                  , embedInNavigationView: false)
                ]
                return .none
            default:
                return .none
            }
        }
        .forEachRoute {
            AppScreen()
        }

    }
}
