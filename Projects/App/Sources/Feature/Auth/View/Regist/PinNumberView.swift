//
//  PinNumberView.swift
//  GetC
//
//  Created by 최윤제 on 2023/11/03.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

import GetCKit
import ComposableArchitecture

struct PinNumberView: View {
    
    let store: StoreOf<PinNumberFeature>
    @ObservedObject var viewStore: ViewStoreOf<PinNumberFeature>
    
    init(store: StoreOf<PinNumberFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: {$0})
    }
    
    var body: some View {
        
        VStack {
            Button {
                viewStore.send(.closeButtonTap)
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.system(size: 22))
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, GetCGridRules.globalHorizontalPadding)

            Spacer()
                .frame(height: 112)
            Text(viewStore.state.pinNumberState == .first ? "PIN번호를 입력하세요" : "PIN번호를 재입력하세요")
                .font(.system(size: 19))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, GetCGridRules.globalHorizontalPadding)
            
            Spacer()
                .frame(height: 112)
            HStack(spacing: 20) {
                Spacer()
                    .padding(.horizontal, 16)
                ForEach(0..<6) { row in
                    Circle()
                        .foregroundColor( viewStore.state.pinNumber.count < row + 1 ? Color(UIColor.systemGray5) : Color.yellow  )
                }
                Spacer()
                    .padding(.horizontal, 16)
            }
            Text(viewStore.pinNumberErrorLabel.rawValue)
                .font(.system(size: 14))
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 52)
            
            Spacer()
                .frame(height: 200)
            
            VStack {
                ForEach(0..<4) { column in
                    HStack {
                        ForEach(0..<3) { row in
                            Button {
                                viewStore.send(.padButtonTap(column: column, row: row))
                            } label: {
                                Text(viewStore.state.padArray[column][row])
                                    .font(.system(size: 28))
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
                
            }
            .background(Color(UIColor.systemGray6))
        }
        
    }
}

struct PinNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PinNumberView(store: Store.init(initialState: PinNumberFeature.State.init(), reducer: {
            PinNumberFeature()
        }))
    }
}


