//
//  AppScreen.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/30.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import ComposableArchitecture
import TCACoordinators

public struct AppScreen: Reducer {
    public enum State: Equatable {
        case splash(SplashFeature.State)
        case auth(AuthCoordinator.State)
        case feed(FeedCoordinator.State)
        case setting(SettingCoordinator.State)
    }
    
    public enum Action {
        case splash(SplashFeature.Action)
        case auth(AuthCoordinator.Action)
        case feed(FeedCoordinator.Action)
        case setting(SettingCoordinator.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.splash, action: /Action.splash) {
            SplashFeature()
        }
        
        Scope(state: /State.auth, action: /Action.auth) {
            AuthCoordinator()
        }
        
        Scope(state: /State.feed, action: /Action.feed) {
            FeedCoordinator()
        }
        
        Scope(state: /State.setting, action: /Action.setting) {
            SettingCoordinator()
        }
    }

}
