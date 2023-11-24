//
//  InViteCodeFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/01.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import NetworkKit
import GetCKit

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
        
        // In
        case inValidCode
        
        // Coordinator
        case navigationButtonTap
        case toTogehterView
    }
    
    @Dependency(\.apiService) var apiService
    
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .textEditing(let text):
            state.codeText = text
            return .none
        case .navigationButtonTap:
            return .none
        case .authButtonTap:
            let code = state.codeText
            #if DEBUG
            if code == "aaaaaa" {return .send(.toTogehterView)} // master Code
            #endif
            return .run { send in
                let data = await apiService.apiRequset(type: ChkCodeDTO.self, router: AuthRouter.chkCode(code: code))
                switch data.code {
                case ServerErrorCode.validCode.rawValue:
                    await send(.toTogehterView)
                default:
                    await send(.inValidCode)
                }
                
            }
        case .toTogehterView:
            UserDefaultWrapper.pinNumber = state.codeText
            return .none
        case .inValidCode:
            state.validCode = false
            return .none
        default:
            return .none
        }
    }
    
}
