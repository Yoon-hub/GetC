//
//  ListView.swift
//  GetC
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

import ComposableArchitecture

struct FeedListView: View {
    
    public let store: StoreOf<FeedListFeature>
    @ObservedObject var viewStore: ViewStoreOf<FeedListFeature>
    
    init(store: StoreOf<FeedListFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: {$0})
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    
                }
                List(viewStore.feedList) { feedItem in
                    FeedItemView(feedItem: feedItem)
                        .listRowSeparator(.hidden)
                    Color.init(uiColor: UIColor.systemGray6)
                        .frame(height: 12)
                        .listRowInsets(EdgeInsets())
      
                }
                .listStyle(.plain)

            }
        }
        .task {
                viewStore.send(.viewAppear)
            }
    }
}

#Preview {
    FeedListView(store: .init(initialState: .init(), reducer: {
        FeedListFeature()
    }))
}
