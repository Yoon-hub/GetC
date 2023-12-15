//
//  CodeItemView.swift
//  GetC
//
//  Created by 윤제 on 12/15/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

struct CodeItemView: View {
    
    let code: String
    let expire: Bool
    
    var body: some View {
        VStack {
            Text(code)
                .lineLimit(1)
                .font(.system(size: 26))
                .fontWeight(.bold)
            Spacer()
                .frame(height: 8)
            Text(expire ? "사용완료" : "사용가능")
                .foregroundColor(Color(uiColor: expire ? UIColor.red : UIColor.gray))
        }
        .frame(width: 120)
        .padding(.horizontal, 82)
        .padding(.vertical, 26)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(uiColor: expire ? UIColor.red : UIColor.lightGray), lineWidth: 2)
        )
        
    }
}

#Preview {
    CodeItemView(code: "AAAAAA", expire: true)
}
