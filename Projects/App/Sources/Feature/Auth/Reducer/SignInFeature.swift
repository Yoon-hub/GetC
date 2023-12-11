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
        var shouldShowErrorAlert: Bool = false
        var errorText = ""
    }
    
    public enum Action {
        case addContact(PresentationAction<PinNumberFeature.Action>)
        case emailTextFiledChanged(String)
        case pinNumberButtonTap
        case signInButtonTap
        case navigationBackButtonTap
        case errorMessageAction
        
        // inner
        case errorMessage(message: String)
        case routeToFeed
    }
    
    @Dependency(\.apiService) var apiService
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .emailTextFiledChanged(let text):
                state.emailText = text
                return .none
            case .pinNumberButtonTap:
                state.addContact = PinNumberFeature.State(pinNumberState: .signIn)
                return .none
            case .signInButtonTap:
                let id = state.emailText
                let pw = state.passwordText
                return .run { send in
                    let response = await apiService.apiRequset(type: SignInDTO.self, router: AuthRouter.signIn(id: id, pw: pw))
                    
                    if let data = response.data {
                        // 메인화면 진입
                        UserDefaultWrapper.userId = "\(data.userID)"
                        await send(.routeToFeed)
                    } else {
                        await send(.errorMessage(message: response.message))
                    }
                    
                }
            case .addContact(.presented(.closeButtonTap)):
                state.addContact = nil
                return .none
            case .addContact(.presented(.passPinNumber(pin: let pin))):
                state.passwordText = pin
                state.addContact = nil
                return .none
            case .navigationBackButtonTap:
                return .none
            case .errorMessage(let message):
                state.errorText = message
                state.shouldShowErrorAlert = true
                return .none
            case .routeToFeed:
                return .none
            case .errorMessageAction:
                state.shouldShowErrorAlert = false
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


