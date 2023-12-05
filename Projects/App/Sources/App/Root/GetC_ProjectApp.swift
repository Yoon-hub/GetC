//
//  GetC_ProjectApp.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

import ComposableArchitecture

@main
struct SwiftUI_GetC_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(store:
                Store(initialState: .initialState, reducer: {
                    AppCoordinator()
            })
            )
        }
    }
}
