//
//  ListView.swift
//  GetC
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture

struct FeedListView: View {
    
    public let store: StoreOf<FeedListFeature>
    @ObservedObject var viewStore: ViewStoreOf<FeedListFeature>
    
    init(store: StoreOf<FeedListFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: {$0})
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                //MARK: Header
                HStack {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 26))
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 26))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 16)
                
                List(viewStore.feedList) { feedItem in
                    FeedItemView(feedItem: feedItem)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    Color.init(uiColor: UIColor.systemGray6)
                        .frame(height: 12)
                        .listRowInsets(EdgeInsets())
      
                }
                .listStyle(.plain)

            }
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(GetCKitAsset.color1.swiftUIColor)
                .overlay {
                    Image(systemName: "plus")
                        .font(.system(size: 26))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 16)
                .padding(.bottom, 16)
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
