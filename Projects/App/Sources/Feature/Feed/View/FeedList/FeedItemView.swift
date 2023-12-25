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
                
                Text(formatTimeDifference(postedAt: feedItem.postedAt))
                    .font(.system(size: 13))
                
                Button {
                    
                } label: {
                    Image("vertical_ellipsis")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                }
            }
            
            Text(feedItem.content)
                .font(.system(size: 13))
                .lineLimit(3)
            
            Spacer()
                .frame(height: 2)
            
            HStack {
                Image(systemName: "heart")
                    .font(.system(size: 13))
                Text("0")
                    .font(.system(size: 13))
                Image(systemName: "bubble.left")
                    .font(.system(size: 13))
                Text("0")
                    .font(.system(size: 13))
                Image(systemName: "eye")
                    .font(.system(size: 13))
                Text("\(feedItem.view)")
                    .font(.system(size: 13))
            }
        }
        .background(.white)
    }
}

#Preview {
    FeedItemView(feedItem: FeedItem(id: 0, title: "감자튀김 가져가", content: "ㅁㄴ이ㅏㄹㅁㄴㅇ;럼나이;니마얼마ㅣ;ㄴㅇ러ㅣㅁ;ㅏㄴ얾;ㅏㅣㄴ얼;미ㅏㄴ얼;미ㅏㄴ얼", authorID: 0, postedAt: Date(), updatedAt: Date(), view: 0, postID: "5"))
}


extension View {
    
    func formatTimeDifference(postedAt: Date?) -> String {
        guard let postDate = postedAt else {return "알 수 없음"}
        
        let koreanPostDate = postDate.addingTimeInterval(32400)
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .weekOfMonth, .day, .hour, .minute], from: koreanPostDate, to: Date())

        if let year = components.year, year >= 1 {
            return "\(year)년 전"
        } else if let month = components.month, month >= 1 {
            return "\(month)개월 전"
        } else if let week = components.weekOfMonth, week >= 1 {
            return "\(week)주 전"
        } else if let day = components.day, day >= 1 {
            return "\(day)일 전"
        } else if let hour = components.hour, hour >= 1 {
            return "\(hour)시간 전"
        } else if let minute = components.minute, minute >= 1 {
            return "\(minute)분 전"
        } else {
            return "방금 전"
        }
    }
}
