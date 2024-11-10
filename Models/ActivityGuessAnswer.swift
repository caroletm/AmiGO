//
//  ActivityGuessAnswer.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 31/10/2024.
//

import Foundation

struct ActivityGuessAnswer: Identifiable {
    let id = UUID()
    let answer: String
    let isCorrect: Bool
}
