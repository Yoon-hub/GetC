//
//  AppCoordinatorView.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/30.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import SwiftUI

import ComposableArchitecture
import TCACoordinators

public struct AppCoordinatorView: View {
    let store: StoreOf<AppCoordinator>
    
    public init(store: StoreOf<AppCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .splash:
                    CaseLet(/AppScreen.State.splash, action: AppScreen.Action.splash, then: SplashView.init)
                case .auth:
                    CaseLet(/AppScreen.State.auth, action: AppScreen.Action.auth, then: AuthCoordinatorView.init)
                }
            }
        }
    }
}
