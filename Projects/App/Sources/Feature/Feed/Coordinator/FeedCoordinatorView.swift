//
//  FeedCoordinatorView.swift
//  GetC
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

import ComposableArchitecture
import TCACoordinators

public struct FeedCoordinatorView: View {
    let store: StoreOf<FeedCoordinator>
    
    public init(store: StoreOf<FeedCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .setFeedList:
                    CaseLet(/FeedScreen.State.setFeedList, action: FeedScreen.Action.setFeedList, then: FeedListView.init)
                case .setFeedAdd(_):
                    CaseLet(/FeedScreen.State.setFeedAdd, action: FeedScreen.Action.setFeedAdd, then: FeedAddView.init)
                }
            }
        }
    }
}
