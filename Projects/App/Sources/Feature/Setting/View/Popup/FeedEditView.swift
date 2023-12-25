//
//  FeedEditView.swift
//  GetC
//
//  Created by 윤제 on 12/21/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

struct FeedEditView: View {
    
    var dismiss: () -> Void
    var feedDelete: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 154)
                .clipShape(
                    .rect(
                        topLeadingRadius: 30,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 30
                    )
                )
                
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    })
                    Spacer()
                        .frame(width: 16)
                }
                
                Button(action: {feedDelete()}, label: {
                    HStack {
                        Spacer()
                            .frame(width: 12)
                        Image(systemName: "trash")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .frame(width: 20, height: 20)
                        Text("글삭제")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                            
                    }
                })
                Spacer()
                    .frame(height: 20)
                
                Button(action: {}, label: {
                    HStack {
                        Spacer()
                            .frame(width: 12)
                        Image(systemName: "eraser")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .frame(width: 20, height: 20)
                        Text("글수정")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                    }
                })
                
                Spacer()
                    .frame(height: 16)
            }
            
        }
    }
}


#Preview {
    FeedEditView(dismiss: {}, feedDelete: {})
}
