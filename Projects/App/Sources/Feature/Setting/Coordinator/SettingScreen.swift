//
//  Coordinator.swift
//  GetC
//
//  Created by 윤제 on 12/14/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import ComposableArchitecture
import TCACoordinators

public struct SettingScreen: Reducer {
    public enum State: Equatable {
        case setSettingList(SettingListFeature.State)
        case setInviteCode(InvitedCodeFeature.State)
        case setMyFeedList(MyFeedListFeature.State)
    }
    
    public enum Action {
        case setSettingList(SettingListFeature.Action)
        case setInviteCode(InvitedCodeFeature.Action)
        case setMyFeedList(MyFeedListFeature.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.setSettingList, action: /Action.setSettingList) {
            SettingListFeature()
        
        }
        Scope(state: /State.setInviteCode, action: /Action.setInviteCode) {
            InvitedCodeFeature()
        
        }
        Scope(state: /State.setMyFeedList, action: /Action.setMyFeedList) {
            MyFeedListFeature()
        
        }
    
    }
    
}
