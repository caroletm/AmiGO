//
//  Activity.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 30/10/2024.
//

import Foundation

enum Activity: String, Hashable, CaseIterable {
    case riddle = "Devinettes"
    case quizz = "Quizz"
    case game = "Jeux"
    case subjectConv = "Sujets"
}
