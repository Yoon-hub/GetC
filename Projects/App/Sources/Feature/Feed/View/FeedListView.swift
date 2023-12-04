//
//  ListView.swift
//  GetC
//
//  Created by VP on 12/4/23.
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
        Text("FeedListView")
    }
}
