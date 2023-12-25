//
//  MyFeedListView.swift
//  GetC
//
//  Created by 윤제 on 12/19/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture
import PopupView

public struct MyFeedListView: View {
    
    let store: StoreOf<MyFeedListFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyFeedListFeature>
    
    init(store: StoreOf<MyFeedListFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: {$0})
    }
    
    public var body: some View {
        List(viewStore.feedList) { feedItem in
            FeedItemView(feedItem: feedItem)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                .onTapGesture {
                    viewStore.send(.listItemTap(item: feedItem))
                }
            
            Color.init(uiColor: UIColor.systemGray6)
                .frame(height: 6)
                .listRowInsets(EdgeInsets())
                .listRowInsets(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
            
        }
        .listStyle(.plain)
        .task {
            viewStore.send(.viewAppear)
        }
        .navigationBackButtonSet {
            
        }
        .navigationTitle("내가 쓴 글 \(viewStore.feedList.count)건")
        .popup(isPresented: viewStore.binding(get: \.isPresentedSheetView, send: MyFeedListFeature.Action.sheetViewDismissed)) {
            FeedEditView {
                viewStore.send(.xButtonTap)
            } feedDelete: {
                viewStore.send(.listDeleteButtonTap)
            }
        } customize: {
            $0
                .type(.toast)
                .position(.bottom)
                .animation(.spring(duration: 0.1))
                .closeOnTapOutside(true)
                .backgroundColor(.black.opacity(0.5))
        }
        
    }
    
}

#Preview {
    MyFeedListView(store: .init(initialState: .init(), reducer: {
        MyFeedListFeature()
    }))
}
