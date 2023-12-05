//
//  FeedItemView.swift
//  GetC
//
//  Created by 윤제 on 12/5/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

import GetCKit

struct FeedItemView: View {
    
    let feedItem: FeedItem
    
    init(feedItem: FeedItem) {
        self.feedItem = feedItem
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                
                Text(feedItem.title)
                    .bold()
                    .font(.system(size: 16))
                    .lineLimit(2)
                
                Spacer()
                
                Text("25분전")
                    .font(.system(size: 13))
                
                Button {
                    print("...button")
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
            }
            
            Text(feedItem.content)
                .font(.system(size: 13))
                .lineLimit(3)
            
            HStack {
                Image(systemName: "heart")
                    .font(.system(size: 13))
                Text("3")
                    .font(.system(size: 13))
                Image(systemName: "bubble.left")
                    .font(.system(size: 13))
                Text("3")
                    .font(.system(size: 13))
                Image(systemName: "eye")
                    .font(.system(size: 13))
                Text("\(feedItem.view)")
                    .font(.system(size: 13))
            }
            
        }
        .background(.white)
//        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
    }
}

#Preview {
    FeedItemView(feedItem: FeedItem(id: 0, title: "감자튀김 가져가", content: "ㅁㄴ이ㅏㄹㅁㄴㅇ;럼나이;니마얼마ㅣ;ㄴㅇ러ㅣㅁ;ㅏㄴ얾;ㅏㅣㄴ얼;미ㅏㄴ얼;미ㅏㄴ얼", authorID: 0, postedAt: Date(), updatedAt: Date(), view: 0))
}

