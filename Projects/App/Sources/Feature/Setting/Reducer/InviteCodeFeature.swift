//
//  InviteCodeFeature.swift
//  GetC
//
//  Created by 윤제 on 12/14/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import NetworkKit
import GetCKit

import ComposableArchitecture

public struct InvitedCodeFeature: Reducer {
    
    public struct State: Equatable {
        
        var codeList: [Datum] = []
        var isShowAlert = false
        
        public static func == (lhs: InvitedCodeFeature.State, rhs: InvitedCodeFeature.State) -> Bool {
            lhs.codeList.count == rhs.codeList.count && lhs.isShowAlert == rhs.isShowAlert && lhs.codeList.last?.inviteCode == rhs.codeList.last?.inviteCode
        }
    }
    
    public enum Action {
        // MARK: User Interaction
        case codeMakeButtonTap
        case navigationBackButtonTap
        // MARK: Inner Action
        case addCodeList([Datum])
        case requestCodeMake
        case hiddeAlert
        // MARK: Inner State Change
        case viewAppear
    }
    
    @Dependency(\.apiService) var apiService
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewAppear:
                
                let userId = UserDefaultWrapper.userId
                
                return .run { send in
                    let response = await apiService.apiRequset(type: CodeListDTO.self, router: AuthRouter.codeList(userId: userId))
                        await send(.addCodeList(response.data))
                }
            case .addCodeList(let data):
                state.codeList.removeAll()
                data.forEach { datum in
                    state.codeList.append(datum)
                }
                return .none
            case .codeMakeButtonTap:
                if state.codeList.count >= 3 {
                    state.isShowAlert = true
                    return .none
                } else {
                    return .send(.requestCodeMake)
                }
            case .requestCodeMake:
                let userId = UserDefaultWrapper.userId
                return .run { send in
                    await apiService.apiRequset(type: CodeMakeDTO.self, router: AuthRouter.codeMake(userId: userId))
                    await send(.viewAppear)
                }
            case .hiddeAlert:
                state.isShowAlert = false
                return .none
            default:
                return .none
            }
        }
    }
    
    
}

