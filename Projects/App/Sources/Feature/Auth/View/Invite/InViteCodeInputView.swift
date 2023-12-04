//
//  InViteCodeInputView.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/27.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture

public struct InViteCodeView: View {
    
    public let store: StoreOf<InViteCodeFeature>
    @ObservedObject var viewStore: ViewStoreOf<InViteCodeFeature>
    
    init(store: StoreOf<InViteCodeFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: {$0})
    }
    
    public var body: some View {

        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 112)
            Text("초대코드를 입력해주세요.")
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 16)
            
            VStack(alignment: .leading){
                AuthTextField(text: viewStore.binding(get: \.codeText, send: InViteCodeFeature.Action.textEditing), placeholder: "초대코드", error: viewStore.validCode)
                
                
                Text("입력하신 초대코드가 존재하지 않습니다.")
                    .font(.system(size: 11))
                    .foregroundColor(.red)
                    .fontWeight(.semibold)
                    .opacity(viewStore.validCode ? 0 : 1)
                    
                Spacer()
                Button {
                    viewStore.send(.authButtonTap)
                } label: {
                    Text("초대코드 인증하기")
                }
                .buttonStyle(viewStore.codeText.count == 6 ? CommonButtonStyle().any : DisableButtonStyle().any)
            }
            Spacer()
                .frame(height: 16)
            
        }
        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
        .navigationBackButtonSet {
            viewStore.send(.navigationButtonTap)
        }
    }
}

struct InViteCodeView_Previews: PreviewProvider {
    static var previews: some View {
        InViteCodeView(store: Store(initialState: .init(), reducer: {
            InViteCodeFeature()
        }))
    }
}

