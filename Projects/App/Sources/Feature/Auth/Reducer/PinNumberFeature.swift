//
//  PinNumberFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/12.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture

public struct PinNumberFeature: Reducer {
    
    public struct State: Equatable {
        public let padArray = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["←", "0", "⏎"]]
        public var pinNumber = ""
    }
    
    public enum Action {
        case padButtonTap(column: Int, row: Int)
        
        // coordinator
        case closeButtonTap
    }
    
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .padButtonTap(column, row):
            state.pinNumber.append(state.padArray[column][row])
        return .none
        case .closeButtonTap:
            return .none
        }
    }
    
}
