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
                case .setSettingList(let store):
                    CaseLet(/SettingScreen.State.setSettingList, action: SettingScreen.Action.setSettingList, then: SettingListView.init)
                }
                
            }
            
        }
    }
}
