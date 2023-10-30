//
//  View+.swift
//  GetCKit
//
//  Created by 최윤제 on 2023/10/27.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

public extension View {
    
    func navigationBackButtonSet() -> some View {
        self
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                    }
                }
            }

    }
}
