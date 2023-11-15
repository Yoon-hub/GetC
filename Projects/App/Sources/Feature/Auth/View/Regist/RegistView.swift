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
    @State var text: String = ""
    
    init(store: StoreOf<RegistFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: { $0 })
    }
    
    public var body: some View {
        VStack {
            Spacer()
                .frame(height: 112)
            AuthTextField(text: viewStore.binding(get: \.emailText, send: RegistFeature.Action.emailTextFieldEdit), placeholder: "아이디")
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
                viewStore.send(.registButtonTap)
            } label: {
                Text("계정 만들기")
            }
            .buttonStyle(viewStore.state.emailText.count == 0 || viewStore.state.passwordText.count == 0 ?  DisableButtonStyle().any : CommonButtonStyle().any)
            Spacer()
                .frame(height: 16)
            
        }
        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
        .navigationBackButtonSet {
            viewStore.send(.navigationButtonTap)
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
        
        .alert("닉네임을 입력하세요", isPresented: viewStore.binding(get: \.shouldShowAlert, send: RegistFeature.Action.alertAction)) {
            TextField("닉네임", text: $text)
            Button("확인") {
                print(text)
            }
        } message: {
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


//viewStore.binding(get: \.shouldShowAlert, send: RegistFeature.Action.alertAction)
