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
import GetCKit

public struct AuthCoordinator: Reducer {
    
    init() {
       // Utility.print("AuthCoordinator init")
    }
    
    public struct State: Equatable, IndexedRouterState {
        static let initialState = State(
            routes: [.root(.setOnBoarding(.init()), embedInNavigationView: true)]
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
            case .routeAction(_, action: .setOnBoarding(.InvitedButtonTap)):
                state.routes.append(.push(.setInViteCode(.init())))
                return .none
            case .routeAction(_, action: .setInViteCode(.toTogehterView)):
                state.routes.append(.push(.setTogether(.init())))
                return .none
            case .routeAction(_, action: .setTogether(.navigationButtonTap)), .routeAction(_, action: .setInViteCode(.navigationButtonTap)), .routeAction(_, action: .setRegist(.navigationButtonTap)):
                state.routes.pop()
                return .none
            case .routeAction(_, action: .setTogether(.makeAccoutButtonTap)):
                state.routes.append(.push(.setRegist(.init())))
                return .none
            case .routeAction(_, action: .setRegist(.pinNumberButtonTap)):
                state.routes.append(.cover(.setPinNumber(.init()), embedInNavigationView: true))
                return .none
            case .routeAction(_, action: .setPinNumber(.closeButtonTap)):
                state.routes.goBack()
                return .none
            default:
                return .none
            }
        }
        .forEachRoute {
            AuthScreen()
        }

    }
}

