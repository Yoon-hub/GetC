//
//  InviteCodeView.swift
//  GetC
//
//  Created by 윤제 on 12/14/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture
import TCACoordinators

struct InviteCodeView: View {
    
    let store: StoreOf<InvitedCodeFeature>
    @ObservedObject var viewStore: ViewStoreOf<InvitedCodeFeature>
    
    init(store: StoreOf<InvitedCodeFeature>) {
        self.store = store
        viewStore = ViewStore(self.store, observe: {$0})
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 30)
            Text("친구를 초대해 보세요!")
                .fontWeight(.bold)
            Text("총 3명의 친구를 초대할 수 있어요")
            
            Spacer()
                .frame(height: 26)
            
            Button {
                viewStore.send(.codeMakeButtonTap)
            } label: {
                Text("초대코드 생성")
            }
            .buttonStyle(CommonButtonStyle())
            
            
            Spacer()
            
            List(viewStore.codeList, id:\.self) { code in
                
                HStack {
                    Spacer()
                    CodeItemView(code: code.inviteCode, expire: code.isUsed == "0" ? false : true)
                    Spacer()
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            
        }
        .onAppear() {
            viewStore.send(.viewAppear)
        }
        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
        .navigationBackButtonSet {
            viewStore.send(.navigationBackButtonTap)
        }
        .navigationTitle("초대코드")
        .alert("초대코드 생성 불가", isPresented: viewStore.binding(get: \.isShowAlert, send: InvitedCodeFeature.Action.hiddeAlert)) {

        } message: {
            Text("초대 코드는 3개만 발급이 가능해요.")
        }
        
    }
}

#Preview {
    InviteCodeView(store: .init(initialState: .init(), reducer: {
        InvitedCodeFeature()
    }))
}
