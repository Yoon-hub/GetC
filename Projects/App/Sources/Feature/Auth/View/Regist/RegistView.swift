//
//  RegistView.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/03.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture

public struct RegistView: View {
    
    let store: StoreOf<RegistFeature>
    @ObservedObject var viewStore: ViewStoreOf<RegistFeature>
    
    init(store: StoreOf<RegistFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: { $0 })
    }
    
    public var body: some View {
        VStack {
            Spacer()
                .frame(height: 112)
            AuthTextField(text: viewStore.binding(get: \.emailText, send: RegistFeature.Action.emailTextFieldEdit), placeholder: "이메일")
            Spacer()
                .frame(height: 16)
            AuthTextField(text: viewStore.binding(get: \.passwordText, send: RegistFeature.Action.passwordTextFieldEdit), placeholder: "비밀번호")
            Spacer()
            Button {
    
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

struct RegistView_Previews: PreviewProvider {
    static var previews: some View {
        RegistView(store: .init(initialState: .init(), reducer: {
            RegistFeature()
        }))
    }
}
