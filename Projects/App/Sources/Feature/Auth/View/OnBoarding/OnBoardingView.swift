//
//  OnBoardingView.swift
//  GetC
//
//  Created by 최윤제 on 2023/10/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI
import GetCKit

import ComposableArchitecture

struct OnBoardingView: View {
    
    public let store: StoreOf<OnBoardingFeature>
    @ObservedObject var viewStore: ViewStoreOf<OnBoardingFeature>
    
    public init(store: StoreOf<OnBoardingFeature>) {
      self.store = store
      self.viewStore = ViewStore(self.store, observe: { $0 })
    }

    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 170)
                Image("GetC")
                    .resizable()
                    .frame(width: 100, height: 100)
                    
                Spacer()
                Button {
                    viewStore.send(.InvitedButtonTap)
                } label: {
                    Text("초대받고 왔어요!")
                }
                .buttonStyle(CommonButtonStyle())
                .padding(.horizontal, 20)

                HStack {
                    Text("이미 계정이 있어요.")
                    Button {
                    } label: {
                        Text("로그인")
                            .foregroundColor(GetCKitAsset.color2.swiftUIColor)
                            .fontWeight(.bold)
                    }
                }
                Spacer()
                    .frame(height: 170)
                
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(store: Store(initialState: .init(), reducer: {
            OnBoardingFeature()
        }))
    }
}

