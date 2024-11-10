//
//  RoundedCornerBorderButton.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 30/10/2024.
//

import SwiftUI

struct RoundedCornerBorderButton: View {
    var text: String
    var backgroundColor: Color = .accentColor
    var cornerRadius: CGFloat = 10
    var strokeColor: Color = .turquoise
    var lineWidth: CGFloat = 2
    var textColor: Color = .black
    var action: () -> Void = { }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(textColor)
                .padding()
                .background(backgroundColor)
                .clipShape(.rect(cornerRadius: cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(strokeColor, lineWidth: lineWidth)
                )
        }
    }
}

#Preview {
    RoundedCornerBorderButton(text: "Test")
}
