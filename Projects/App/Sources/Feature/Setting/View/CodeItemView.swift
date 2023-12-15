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
    
    var body: some View {
        VStack {
            Text(code)
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding(.horizontal, 99)
                .padding(.vertical, 32)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(uiColor: .lightGray), lineWidth: 2)
                )
        }
        
    }
}

#Preview {
    CodeItemView(code: "AAAAAA")
}
