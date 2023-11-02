//
//  InViteCodeInputView.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/27.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture

public struct InViteCodeView: View {
        
    //@State public var codeText: String = ""
    
    public let store: StoreOf<InViteCodeFeature>
    
    public var body: some View {
        
        WithViewStore(store, observe: {$0}) { viewStore in
            
        }
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 112)
            Text("초대코드를 입력해주세요.")
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 16)
            
            VStack(alignment: .leading){
             //   AuthTextField(text: $codeText)
                Text("입력하신 초대코드가 존재하지 않습니다.")
                    .font(.system(size: 11))
                    .foregroundColor(.red)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    print("멀봐")
                } label: {
                    Text("초대코드 인증하기")
                }
              //  .buttonStyle(codeText.count == 6 ? CommonButtonStyle().any : DisableButtonStyle().any)
            }
            .padding(.horizontal, 12)
            Spacer()
                .frame(height: 16)
            
        }
        .padding(.horizontal, 16)
        .navigationBackButtonSet()
    }
}

//struct InViteCodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        InViteCodeView()
//    }
//}

