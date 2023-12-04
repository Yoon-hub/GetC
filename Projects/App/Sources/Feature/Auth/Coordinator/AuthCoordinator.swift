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
        public var pinNumber: String?
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action:AuthScreen.Action)
        case updateRoutes([Route<AuthScreen.State>])
        
        case moveToFeed
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: AuthScreen.Action.setOnBoarding(.InvitedButtonTap)):
                state.routes.append(.push(.setInViteCode(.init())))
                return .none
            case .routeAction(_, action: .setInViteCode(.toTogehterView)):
                state.routes.append(.push(.setTogether(.init())))
                return .none
            case .routeAction(_, action: .setTogether(.navigationButtonTap)), .routeAction(_, action: .setInViteCode(.navigationButtonTap)), .routeAction(_, action: .setRegist(.navigationButtonTap)), .routeAction(_, action: .setSignIn(.navigationBackButtonTap)):
                state.routes.pop()
                return .none
            case .routeAction(_, action: .setTogether(.makeAccoutButtonTap)):
                state.routes.append(.push(.setRegist(.init())))
                return .none
            case .routeAction(_, action: .setOnBoarding(.loginButtonTap)):
                state.routes.append(.push(.setSignIn(.init())))
                return .none
            case .routeAction(_, action: .setSignIn(.routeToFeed)), .routeAction(_, action: .setRegist(.routeToFeed)):
                return .send(.moveToFeed)
            default:
                return .none
            }
        }
        .forEachRoute {
            AuthScreen()
        }

    }
}



extension Array where Element: RouteProtocol {
  mutating func findAndMutate<ElementSubstate>(_ casePath: CasePath<Element.Screen, ElementSubstate>, _ onlyMostRecent: Bool = true, transform: (inout ElementSubstate) -> Void) {
    for (route, index) in zip(self, indices).reversed() {
      guard var substate = casePath.extract(from: route.screen) else { continue }
      transform(&substate)
      self[index].screen = casePath.embed(substate)
      if onlyMostRecent {
        return
      }
    }
  }
}
