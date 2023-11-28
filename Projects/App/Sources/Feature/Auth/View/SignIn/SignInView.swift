//
//  SingInView.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/24.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture
import TCACoordinators

struct SignInView: View {
    
    public let store: StoreOf<SignInFeature>
    @ObservedObject var viewStore: ViewStoreOf<SignInFeature>
    
    init(store: StoreOf<SignInFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: {$0})
    }
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 112)
            AuthTextField(text: viewStore.binding(get: \.emailText, send: SignInFeature.Action.emailTextFiledChanged), placeholder: "아이디")
            Spacer()
                .frame(height: 16)
            
            Button {
                viewStore.send(.pinNumberButtonTap)
            } label: {
                Text(viewStore.passwordText.count == 0 ? "PIN번호" : "● ● ● ● ● ●")
                    .padding(.leading, 14)
                    .font(.system(size: 22))
                    .foregroundColor(Color(UIColor.systemGray3))
                    .frame(height: 60)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(UIColor.systemGray3))
                    )
            }
            
            
            Spacer()
            Button {
                viewStore.send(.signInButtonTap)
            } label: {
                Text("로그인하기")
            }
            .buttonStyle(viewStore.state.emailText.count == 0 || viewStore.state.passwordText.count == 0 ?  DisableButtonStyle().any : CommonButtonStyle().any)
            Spacer()
                .frame(height: 16)
            
        }
        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
        .navigationBackButtonSet {
            
        }
        .fullScreenCover(
            store: self.store.scope(
                state: \.$addContact,
                action: { .addContact($0) }
            )
        ) { addContactStore in
            NavigationStack {
                PinNumberView(store: addContactStore)
            }
        }
    }
    
}

