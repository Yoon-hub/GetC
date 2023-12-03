//
//  SignInFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/24.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import NetworkKit
import GetCKit

import ComposableArchitecture
import TCACoordinators

public struct SignInFeature: Reducer {
    
    public struct State: Equatable {
        @PresentationState var addContact: PinNumberFeature.State?
        var emailText = ""
        var passwordText = ""
    }
    
    public enum Action {
        case addContact(PresentationAction<PinNumberFeature.Action>)
        case emailTextFiledChanged(String)
        case pinNumberButtonTap
        case signInButtonTap
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .emailTextFiledChanged(let text):
                state.emailText = text
                return .none
            case .pinNumberButtonTap:
                state.addContact = PinNumberFeature.State()
                return .none
            case .signInButtonTap:
                return .none
            case .addContact(.presented(.closeButtonTap)):
                state.addContact = nil
                return .none
            case .addContact(.presented(.passPinNumber(pin: let pin))):
                state.passwordText = pin
                state.addContact = nil
                return .none
            default:
                return .none
            }
            
        }
        .ifLet(\.$addContact, action: /Action.addContact) {
          PinNumberFeature()
        }
    }
    
}


