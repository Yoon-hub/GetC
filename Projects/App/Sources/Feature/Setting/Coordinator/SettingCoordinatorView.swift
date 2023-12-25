//
//  SettingCoordinatorView.swift
//  GetC
//
//  Created by 윤제 on 12/14/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

import ComposableArchitecture
import TCACoordinators

public struct SettingCoordinatorView: View {
    let store: StoreOf<SettingCoordinator>
    
    public init(store: StoreOf<SettingCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .setSettingList(_):
                    CaseLet(/SettingScreen.State.setSettingList, action: SettingScreen.Action.setSettingList, then: SettingListView.init)
                case .setInviteCode(_):
                    CaseLet(/SettingScreen.State.setInviteCode, action: SettingScreen.Action.setInviteCode, then: InviteCodeView.init)
                case .setMyFeedList(_):
                    CaseLet(/SettingScreen.State.setMyFeedList, action: SettingScreen.Action.setMyFeedList, then: MyFeedListView.init)
                }
                
            }
            
        }
    }
}
