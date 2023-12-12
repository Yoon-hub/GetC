//
//  SettingView.swift
//  GetC
//
//  Created by 윤제 on 12/12/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

struct SettingView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 16)
            HStack {
                Image(systemName: "book.closed")
                    .font(.system(size: 30))
                Text("내가 쓴 글")
                    .font(.system(size: 20))
            }
            Spacer()
                .frame(height: 30)
            HStack {
                Image(systemName: "balloon")
                    .font(.system(size: 30))
                Text("친구 초대하기")
                    .font(.system(size: 20))
            }
            
            Spacer()
            
            Button {
                
            }label: {
                Text("로그아웃")
            }
            .buttonStyle(CommonButtonStyle())
        }
        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
        .navigationBackButtonSet {
            
        }
    }
}

#Preview {
    SettingView()
}

