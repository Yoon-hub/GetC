//
//  TogetherView.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/02.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture

public struct TogetherView: View {
    
    let store: StoreOf<TogetherViewFeature>
    @ObservedObject var viewStore: ViewStoreOf<TogetherViewFeature>
    
    init(store: StoreOf<TogetherViewFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: { $0 })
    }
 
    public var body: some View {
        VStack {
            Spacer()
                .frame(height: 112)
            VStack(alignment: .leading) {
                Text("나도 같이 할래요!")
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 60)
                Text("총 글 수 1,000건\n오늘 새로 올라 온 글 12건\n마지막 글은 15분전에 작성되었어요.")
                Divider().opacity(0)
            }
            Spacer()
            Button {
                Utility.print("계정 만들기")
                viewStore.send(.makeAccoutButtonTap)
            } label: {
                Text("계정 만들기")
            }
            .buttonStyle(CommonButtonStyle())
            Spacer()
                .frame(height: 16)
        }
        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
        .navigationBackButtonSet {
            viewStore.send(.navigationButtonTap)
        }
        
        
    }
}

struct TogetherView_Previews: PreviewProvider {
    static var previews: some View {
        TogetherView(store: Store(initialState: .init(), reducer: {
            TogetherViewFeature()
        }))
    }
}
