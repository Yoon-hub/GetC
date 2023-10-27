//
//  OnBoardingView.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

struct OnBoardingView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink  {
                    //InviteCodeView()
                } label: {
                    Text("초대받고 왔어요!")
                }
                .buttonStyle(CommonButtonStyle())

                HStack {
                    Text("이미 계정이 있어요.")
                    Button {
                    } label: {
                        Text("로그인")
                        
                    }
                }
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
