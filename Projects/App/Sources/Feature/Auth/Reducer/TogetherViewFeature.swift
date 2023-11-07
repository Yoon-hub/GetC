//
//  TogetherViewFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/02.
//  Copyright © 2023 com.getc. All rights reserved.
//

import ComposableArchitecture
import TCACoordinators

public struct TogetherViewFeature: Reducer {
    public struct State: Equatable {
        
    }
    
    public enum Action {
        case navigationButtonTap
        case makeAccoutButtonTap
    }
    
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .navigationButtonTap:
            return .none
        case .makeAccoutButtonTap:
            return .none
        default:
            return .none
        }
    }
    

}
