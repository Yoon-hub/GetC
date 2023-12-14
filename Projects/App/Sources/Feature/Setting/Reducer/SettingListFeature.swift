//
//  SettingFeature.swift
//  GetC
//
//  Created by 윤제 on 12/12/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture

public struct SettingListFeature: Reducer {
    
    public struct State: Equatable {
        
    }
    
    public enum Action {
        // MARK: - User Interaction
        case navigationBarBackButtonTap
        case logoutButtonTap
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .navigationBarBackButtonTap:
                return .none
            default:
                return .none
            }
        }
    }
    
}
