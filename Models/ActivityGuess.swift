//
//  Game.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 24/10/2024.
//

import Foundation
import SwiftUI

struct ActivityGuess: Identifiable {
    let id: UUID = UUID()
    let question: String
    let answers: [ActivityGuessAnswer]
    let solution: String
    let theme: String
    let color: Color
    var isHidden: Bool = true
}
