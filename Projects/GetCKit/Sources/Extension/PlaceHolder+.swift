//
//  PlaceHolder.swift
//  GetCKit
//
//  Created by 윤제 on 12/12/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
    func placeholder(shouldShow: Bool, alignment: Alignment = .leading, placeHolderText: () -> some View) -> some View {
        ZStack(alignment: alignment) {
            placeHolderText().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
