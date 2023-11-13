//
//  RegistFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/03.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import ComposableArchitecture

public struct RegistFeature: Reducer {
    public struct State: Equatable {
        @PresentationState var addContact: PinNumberFeature.State?
        var emailText = ""
        var passwordText = ""
    }
    
    public enum Action {
        case addContact(PresentationAction<PinNumberFeature.Action>)
        case emailTextFieldEdit(text: String)
        
        case chagnePinNumber
        
        case navigationButtonTap
        case pinNumberButtonTap
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .emailTextFieldEdit(let text):
                state.emailText = text
                return .none
            case .navigationButtonTap:
                return .none
            case .pinNumberButtonTap:
                state.addContact = PinNumberFeature.State()
                return .none
            case .addContact(.presented(.passPinNumber(pin: let pin))):
                state.passwordText = pin
                state.addContact = nil
                return .none
            case .addContact(.presented(.closeButtonTap)):
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
    
//    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
//
//        switch action {
//        case .emailTextFieldEdit(let text):
//            state.emailText = text
//            return .none
//        case .navigationButtonTap:
//            return .none
//        case .pinNumberButtonTap:
//            return .none
//        default:
//            return .none
//        }
//    }
}

