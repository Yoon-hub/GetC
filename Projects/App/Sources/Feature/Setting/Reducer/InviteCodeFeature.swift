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
        
        var codeList: [String] = []
        
    }
    
    public enum Action {
        // MARK: User Interaction
        case codeMakeButtonTap
        
        // MARK: Inner Action
        case addCodeList([Datum])
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
                    state.codeList.append(datum.inviteCode)
                }
                return .none
            case .codeMakeButtonTap:
                let userId = UserDefaultWrapper.userId
                return .run { send in
                    await apiService.apiRequset(type: CodeMakeDTO.self, router: AuthRouter.codeMake(userId: userId))
                    await send(.viewAppear)
                }
            default:
                return .none
            }
        }
    }
    
    
}
