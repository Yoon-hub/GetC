//
//  InviteCodeView.swift
//  GetC
//
//  Created by 윤제 on 12/14/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture
import TCACoordinators

struct InviteCodeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 30)
            Text("친구를 초대해 보세요!")
                .fontWeight(.bold)
            Text("총 3명의 친구를 초대할 수 있어요")
            
        Spacer()
                .frame(height: 26)
            
            Button {
                
            } label: {
                Text("초대코드 생성")
            }
            .buttonStyle(CommonButtonStyle())
            Spacer()
            
        }
        .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
    }
}

#Preview {
    InviteCodeView()
}
