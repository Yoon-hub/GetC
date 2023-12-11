//
//  FeedAddView.swift
//  GetC
//
//  Created by 윤제 on 12/8/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture

struct FeedAddView: View {
    
    let store: StoreOf<FeedAddFeature>
    @ObservedObject var viewStore: ViewStoreOf<FeedAddFeature>
    var feedListRefresh: (() -> Void)?
    
    init(store: StoreOf<FeedAddFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: {$0})
    }
    
    var body: some View {
        VStack {
            
            HStack { // Header
                Button {
                    viewStore.send(.xButtonTap)
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                Spacer()
                Button {
                    viewStore.send(.completeButotnTap)
                    feedListRefresh?()
                } label: {
                    Text(viewStore.state.completeButtonState == .enable ? "완료" : "취소")
                        .foregroundColor(.black)
                }
            }
            Spacer()
            MultiStyleTextView(text: viewStore.binding(get: \.feedText, send: FeedAddFeature.Action.feedTextFieldEdit))
            
        }
        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
        .alert("업로드 오류", isPresented: viewStore.binding(get: \.isShowAlert, send: FeedAddFeature.Action.hideAlert)) {
        } message: {
            Text("업로드에 실패하였습니다.")
        }
    
    }
}

#Preview {
    FeedAddView(store: StoreOf<FeedAddFeature>.init(initialState: .init(feedListRefresh: {}), reducer: {
        FeedAddFeature()
    }))
}
