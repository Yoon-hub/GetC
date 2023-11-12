//
//  AuthTextField.swift
//  GetCKit
//
//  Created by 최윤제 on 2023/10/27.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

public struct AuthTextField: View {
    
    @Binding public var text: String
    public var placeholder: String
    public var error: Bool
    
    public init(text: Binding<String>, placeholder: String = "", error: Bool = true) {
        self._text = text
        self.placeholder = placeholder
        self.error = error
    }
    
    public var body: some View {
        TextField(placeholder, text: $text)
            .font(.system(size: 22))
            .frame(height: 62)
            .padding(.horizontal, 12)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(error ? Color(UIColor.systemGray3) : Color.red, lineWidth: 1)
            )
            .autocapitalization(.none)
    }
}

public struct AuthTextFieldSample: View {
    @State public var text: String = ""
    
    public var body: some View {
        VStack {
            AuthTextField(text: $text)
        }
        .padding(.horizontal, 23)

    }
    
}
struct AuthTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        AuthTextFieldSample()
    }
}

