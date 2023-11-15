//
//  PinNumberFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/12.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture

public enum PinNumberFlow {
    case first
    case second
}

public enum PinNumberErrorLable: String {
    case different = "PIN이 일치하지 않습니다."
    case nono = " "
}

public struct PinNumberFeature: Reducer {
    
    public struct State: Equatable {
        
        public let padArray = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["", "0", "←"]]
        public var pinNumberStore = ""
        public var pinNumber = ""
        public var pinNumberState: PinNumberFlow = .first
        public var pinNumberErrorLabel: PinNumberErrorLable = .nono
    }
    
    public enum Action {
        case padButtonTap(column: Int, row: Int)
        
        // Inner
        case sixNumberInput
        // coordinator
        case closeButtonTap
        case passPinNumber(pin: String)
    }
    
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
            
        case let .padButtonTap(column, row):
            state.pinNumberErrorLabel = .nono // 시작하면 오류 라벨 지우기
            if column == 3 && row == 2 { // 마지막 버튼은 삭제
                if state.pinNumber.count == 0 {return .none}
                state.pinNumber.removeLast()
                return .none
            } else {
                state.pinNumber.append(state.padArray[column][row])
                if state.pinNumber.count == 6 { return .send(.sixNumberInput)}
            }
            
        return .none
        case .closeButtonTap:
            return .none
        case .sixNumberInput:

            if state.pinNumberState == .first { // 첫번째 6개
                state.pinNumberState = .second
                state.pinNumberStore = state.pinNumber
                state.pinNumber = ""
            } else if state.pinNumberState == .second { // 두번째 6개
                
                if state.pinNumber != state.pinNumberStore { // 비밀번호 틀릴경우
                    state.pinNumberState = .first
                    state.pinNumberStore = ""
                    state.pinNumber = ""
                    state.pinNumberErrorLabel = .different
                } else if state.pinNumber == state.pinNumberStore { // 일치할 경우
                    return .send(.passPinNumber(pin: state.pinNumber))
                }
                
            }
            return .none
        case .passPinNumber:
            return .none
        }   
    }
    
}
