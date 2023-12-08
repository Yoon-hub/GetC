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
import SwiftUIIntrospect

struct FeedListView: View {
    
    public let store: StoreOf<FeedListFeature>
    @ObservedObject var viewStore: ViewStoreOf<FeedListFeature>
    let feedRefreshHandler: FeedRefreshHandler
    
    init(store: StoreOf<FeedListFeature>) {
        self.store = store
        let viewStore = ViewStore(self.store, observe: {$0})
        self.viewStore = viewStore
        self.feedRefreshHandler = FeedRefreshHandler(viewStore: viewStore)
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
                .introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17)) { tableView in
                    
                    let myRefresh = UIRefreshControl()
                    feedRefreshHandler.myRefresh = myRefresh
                    
                    myRefresh.addTarget(feedRefreshHandler, action: #selector(FeedRefreshHandler.refreshFeed), for: .valueChanged)
                    tableView.refreshControl = myRefresh
                    
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

final class FeedRefreshHandler {
    let viewStore: ViewStoreOf<FeedListFeature>
    var myRefresh: UIRefreshControl?
    
    init(viewStore: ViewStoreOf<FeedListFeature>) {
        self.viewStore = viewStore
    }
    
    @objc func refreshFeed() {
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [weak self] in
            self?.viewStore.send(.refresh)
            self?.myRefresh?.endRefreshing()
        }
    }
}

#Preview {
    FeedListView(store: .init(initialState: .init(), reducer: {
        FeedListFeature()
    }))
}
