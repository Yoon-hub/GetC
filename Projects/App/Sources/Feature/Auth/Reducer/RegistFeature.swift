//
//  RegistFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/03.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import ComposableArchitecture

import NetworkKit
import GetCKit

public struct RegistFeature: Reducer {
    public struct State: Equatable {
        @PresentationState var addContact: PinNumberFeature.State?
        var emailText = ""
        var passwordText = ""
        var shouldShowNicknameAlert: Bool = false
        var shouldShowErrorAlert: Bool = false
        var errorText = ""
    }
    
    public enum Action {
        
        //MARK: - UserInteraction
        case addContact(PresentationAction<PinNumberFeature.Action>)
        case emailTextFieldEdit(text: String)
        
        case errorMessageAction
        case chagnePinNumber
        case nickNameInput(nickName: String)

        
        //MARK: - Inner ACtion
        case errorMessage(message: String)
        case alertAction
        case routeToFeed
        
        case navigationButtonTap
        case pinNumberButtonTap
        case registButtonTap
    }
    
    @Dependency(\.apiService) var apiService
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .emailTextFieldEdit(let text):
                state.emailText = text
                return .none
            case .navigationButtonTap:
                return .none
            case .pinNumberButtonTap:
                state.addContact = PinNumberFeature.State(pinNumberState: .first)
                return .none
            case .addContact(.presented(.passPinNumber(pin: let pin))):
                state.passwordText = pin
                state.addContact = nil
                return .none
            case .addContact(.presented(.closeButtonTap)):
                state.addContact = nil
                return .none
            case .registButtonTap:
                state.shouldShowNicknameAlert = true
                return .none
            case .alertAction:
                state.shouldShowNicknameAlert = false
                return .none
            case .nickNameInput(let nickName):
                let id = state.emailText
                let pw = state.passwordText
                return .run { send in
                    let response = await apiService.apiRequset(type: SignUpDTO.self, router: AuthRouter.signUp(id: id, pw: pw, nickName: nickName, joinCode: UserDefaultWrapper.pinNumber))
                    
                    if let data = response.data {
                        // 메인화면 진입
                        await send(.routeToFeed)
                    } else {
                        await send(.errorMessage(message: response.message))
                    }
                }
            case .errorMessage(let message):
                state.errorText = message
                state.shouldShowErrorAlert = true
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

