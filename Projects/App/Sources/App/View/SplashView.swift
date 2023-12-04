//
//  Splash.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/30.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

public struct SplashView: View {
    
    public let store: StoreOf<SplashFeature>
    
    @State var opacity: Double = 1.0
    
    init(store: StoreOf<SplashFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: {$0}) { viewStore in
            Image("GetC")
                .resizable()
                .frame(width: 200, height: 200)
                .opacity(opacity)
                
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        opacity = 0.0
                    }
                    store.send(._onApper)
                }
        }

    }
    
}

private struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(store: Store(initialState: SplashFeature.State(), reducer: {
            SplashFeature()
        }))
    }
}

