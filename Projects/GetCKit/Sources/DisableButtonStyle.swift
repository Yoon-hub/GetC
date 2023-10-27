//
//  DisableButtonStyle.swift
//  GetCKit
//
//  Created by 최윤제 on 2023/10/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import SwiftUI

public struct DisableButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .background(.white)
            .foregroundColor(.gray)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal, 20)
    }
}
