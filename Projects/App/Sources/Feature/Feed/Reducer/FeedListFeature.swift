//
//  FeedListFeature.swift
//  GetC
//
//  Created by VP on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture

public struct FeedListFeature: Reducer {
    
    public struct State: Equatable {
        
    }
    
    public enum Action {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
    
}
