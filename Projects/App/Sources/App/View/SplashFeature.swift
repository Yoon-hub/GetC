//
//  SplashFeature.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/30.
//  Copyright © 2023 com.getc. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

public struct SplashFeature: Reducer {
    
    public struct State: Equatable {
        
    }
    
    public enum Action {
        case _onApper
        case _moveToAuth
    }
    
    @Dependency(\.continuousClock) var clock

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case ._onApper:
            return .run { send in
                try await self.clock.sleep(for: .milliseconds(1500))
                await send(._moveToAuth)
            }
        case ._moveToAuth:
            print("moveToAuth")
            return .none
        }
    }
    
}

