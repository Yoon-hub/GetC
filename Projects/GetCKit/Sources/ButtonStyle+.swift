//
//  ButtonStyle+.swift
//  GetCKit
//
//  Created by 최윤제 on 2023/10/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import SwiftUI

extension ButtonStyle {
    
    var any: AnyButtonStyle {
        AnyButtonStyle(self)
    }

}

struct AnyButtonStyle: ButtonStyle {
    
    private let makeBodyConfig: (ButtonStyle.Configuration) -> AnyView // AnyView View를 wrapping 해서 리턴 타입을 맞춰주는 타입
    
    init<T: ButtonStyle>(_ style: T) {
        makeBodyConfig = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        makeBodyConfig(configuration)
    }
    
}
