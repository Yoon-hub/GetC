//
//  SettingCoordinator.swift
//  GetC
//
//  Created by 윤제 on 12/14/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture
import TCACoordinators

public struct SettingCoordinator: Reducer {
    
    public struct State: Equatable, IndexedRouterState {
        
        static let initialState = State(
            routes: [.root(.setSettingList(.init()), embedInNavigationView: false)]
        )
        
        public var routes: [Route<SettingScreen.State>]
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: SettingScreen.Action)
        case updateRoutes([Route<SettingScreen.State>])
        
        case moveToFeed
        case moveToAuth
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .setSettingList(.navigationBarBackButtonTap)):
                return .send(.moveToFeed)
            case .routeAction(_, action: .setSettingList(.logoutButtonTap)):
                return .send(.moveToAuth)
            default:
                return .none
            }
        }
        .forEachRoute {
            SettingScreen()
        }
    }
}