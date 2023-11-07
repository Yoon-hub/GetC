//
//  InViteCodeFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/01.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture
import TCACoordinators

public struct InViteCodeFeature: Reducer {
    public struct State: Equatable {
        var codeText = ""
        var validCode = true
    }
    
    public enum Action {
        case textEditing(text: String)
        case authButtonTap
        
        // Coordinator
        case navigationButtonTap
        case toTogehterView
    }
    
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .textEditing(let text):
            state.codeText = text
            return .none
        case .navigationButtonTap:
            return .none
        case .authButtonTap:
            return .send(.toTogehterView)
        case .toTogehterView:
            return .none
        default:
            return .none
        }
    }
    
}
