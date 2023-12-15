//
//  SettingView.swift
//  GetC
//
//  Created by 윤제 on 12/12/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture

struct SettingListView: View {
    
    let store: StoreOf<SettingListFeature>
    @ObservedObject var viewStore: ViewStoreOf<SettingListFeature>
    
    init(store: StoreOf<SettingListFeature>) {
        self.store = store
        viewStore = ViewStore(self.store, observe: {$0})
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 16)
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "book.closed")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                    Text("내가 쓴 글")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
                .frame(height: 30)
            
            Button {
                viewStore.send(.invitedFriendButtonTap)
            } label: {
                HStack {
                    Image(systemName: "balloon")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                    Text("친구 초대하기")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
            
            Button {
                viewStore.send(.logoutButtonTap)
            }label: {
                Text("로그아웃")
            }
            .buttonStyle(CommonButtonStyle())
            Spacer()
                .frame(height: 16)
        }
        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
        .navigationBackButtonSet {
            viewStore.send(.navigationBarBackButtonTap)
        }
    }
}

#Preview {
    SettingListView(store: .init(initialState: .init(), reducer: {
        SettingListFeature()
    }))
}

 
