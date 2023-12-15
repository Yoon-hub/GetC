//
//  MultiStyleTextView.swift
//  GetC
//
//  Created by 윤제 on 12/8/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import SwiftUI

struct MultiStyleTextView: UIViewRepresentable {
    @Binding var text: String
    let placerHolder = "글제목       "

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = true
        textView.delegate = context.coordinator
        textView.font = UIFont.boldSystemFont(ofSize: 26)
        textView.text = placerHolder
        textView.textColor = UIColor.systemGray5
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
       // uiView.attributedText = attributedText()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    private func attributedText() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        // Check if there is at least one newline character
        if let newlineRange = text.range(of: "\n") {
            let newlineStart = newlineRange.lowerBound
            let newlineEnd = newlineRange.upperBound
            
            // Apply a different font to the text before the newline character
            let beforeNewlineRange = text.startIndex..<newlineStart
            attributedString.addAttributes([.font: UIFont.boldSystemFont(ofSize: 26)], range: NSRange(beforeNewlineRange, in: text))
            
            // Apply a different font to the text after the newline character
            let afterNewlineRange = newlineEnd..<text.endIndex
            attributedString.addAttributes([.font: UIFont.systemFont(ofSize: 16)], range: NSRange(afterNewlineRange, in: text))
        } else {
            let beforeNewlineRange = text.startIndex..<text.endIndex
            attributedString.addAttributes([.font: UIFont.boldSystemFont(ofSize: 26)], range: NSRange(beforeNewlineRange, in: text))
        }

        return attributedString
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultiStyleTextView

        init(_ parent: MultiStyleTextView) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == parent.placerHolder {
                textView.text = ""
                textView.textColor = UIColor.black
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text == "" {
                textView.text = parent.placerHolder
                textView.textColor = UIColor.lightGray
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            // Save the current cursor position
            let cursorPosition = textView.selectedRange.location

            // Update the binding when the text changes
            parent.text = textView.text

            // Apply attributed text and reset cursor position
            textView.attributedText = parent.attributedText()
            textView.selectedRange = NSRange(location: cursorPosition, length: 0)
        }
    }
}
