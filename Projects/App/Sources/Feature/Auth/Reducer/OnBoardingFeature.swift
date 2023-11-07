//
//  OnBoardingFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/30.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture

public struct OnBoardingFeature: Reducer {
    public struct State: Equatable {
        
    }
    
    public enum Action {
        case InvitedButtonTap
    }
    
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .InvitedButtonTap:
            return .none
        }
    }
}

