//
//  AuthScreen.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/30.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture
import TCACoordinators

public struct AuthScreen: Reducer {
    public enum State: Equatable {
        case setOnBoarding(OnBoardingFeature.State)
        case setInViteCode(InViteCodeFeature.State)
    }
    
    public enum Action {
        case setOnBoarding(OnBoardingFeature.Action)
        case setInViteCode(InViteCodeFeature.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.setOnBoarding, action: /Action.setOnBoarding) {
            OnBoardingFeature()
        }
        
        Scope(state: /State.setInViteCode, action: /Action.setInViteCode) {
            InViteCodeFeature()
        }
    }
}
