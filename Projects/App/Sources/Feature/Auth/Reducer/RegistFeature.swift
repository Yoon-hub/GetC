//
//  RegistFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/03.
//  Copyright © 2023 com.getc. All rights reserved.
//

import ComposableArchitecture

public struct RegistFeature: Reducer {
    public struct State: Equatable {
        var emailText = ""
        var passwordText = ""
    }
    
    public enum Action {
        case emailTextFieldEdit(text: String)
        case passwordTextFieldEdit(text: String)
        
        case navigationButtonTap
    }
    
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .emailTextFieldEdit(let text):
            state.emailText = text
            return .none
        case .passwordTextFieldEdit(let text):
            state.passwordText = text
            return .none
        case .navigationButtonTap:
            return .none
        default:
            return .none
        }
    }
    
}
