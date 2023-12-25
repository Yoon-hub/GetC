//
//  FeedDetailView.swift
//  GetC
//
//  Created by 윤제 on 12/19/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture

struct FeedDetailView: View {
    
    let store: StoreOf<FeedDetailFeature>
    @ObservedObject var viewStore: ViewStoreOf<FeedDetailFeature>
    
    init(store: StoreOf<FeedDetailFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: {$0})
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                        .frame(height: 4)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(viewStore.feedItem.title)
                                    .font(.system(size: 16))
                                    .bold()
                                Text(formatTimeDifference(postedAt: viewStore.feedItem.postedAt))
                                    .font(.system(size: 13))
                            }
                            
                            Spacer()
                            
                            Button(action: {viewStore.send(.heartButtonTapped)}, label: {
                                Image(systemName: viewStore.heartState ? "heart.fill" : "heart")
                                    .font(.system(size: 19))
                                    .foregroundColor(.black)
                            })
                            
                        }
                        
                        Text(viewStore.feedItem.content)
                            .font(.system(size: 14))
                    }
                    .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
                    
                    Spacer()
                        .frame(height: 28)
                    
                    Divider()
                        .padding(.bottom, 16)
                    
                    HStack {
                        Image(systemName: "bubble.left")
                            .font(.system(size: 14))
                        Text("0")
                            .font(.system(size: 14))
                    }
                    .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
                    
                    Spacer()
                    
                   
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    AuthTextField(text: viewStore.binding(get: \.commentText, send: FeedDetailFeature.Action.commentTextDidChange), placeholder: "댓글쓰기", height: 42, fontSize: 14)
                    Button(action: {}, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    })
                }
                .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
                Spacer()
                    .frame(height: 22)
            }
        }

        .navigationBackButtonSet {
            viewStore.send(.navigationBackButtonTapped)
        }
    }
}

#Preview {
    FeedDetailView(store: .init(initialState: .init(feedItem: FeedItem(id: 2, title: "타이틀입니다요~", content: "asdasdㅁㄴ이ㅏ;럼ㄴ;이ㅏ럼;ㅣ낭러ㅣ만ㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴasfdlkjasdlkfjaslk;dfja;lskdfjㅁㄴㅇ리;ㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇ;ㅣ라ㅓㅁㄴㅇㄹ", authorID: 6, postedAt: Date(), updatedAt: Date(), view: 5, postID: "5")), reducer: {
        FeedDetailFeature()
    }))
}
