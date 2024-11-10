//
//  SpeechBubbleBottom.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 04/11/2024.
//

import SwiftUI

struct SpeechBubbleBottom: Shape {
    private let radius: CGFloat
    private let tailSize: CGFloat

    init(radius: CGFloat = 10) {
        self.radius = radius
        tailSize = 20
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX - 3 * radius / 2, y: rect.maxY - radius))
            path.addArc(
                center: CGPoint(x: rect.minX - radius / 2, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.maxX + radius / 2, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.maxX + radius / 2, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: rect.maxX / 2 + tailSize / 2, y: rect.maxY))
            path.addCurve(
                to: CGPoint(x: rect.maxX / 2 - tailSize / 2, y: rect.maxY),
                control1: CGPoint(x: rect.maxX / 2, y: rect.maxY + 2 * tailSize + radius),
                control2: CGPoint(x: rect.maxX / 2, y: rect.maxY + radius)
            )
            path.addArc(
                center: CGPoint(x: rect.minX - radius / 2, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
        }
    }
}

#Preview {
    SpeechBubbleBottom()
        .stroke(Color.gray, lineWidth: 3)
        .frame(width: 200, height: 100)
}
