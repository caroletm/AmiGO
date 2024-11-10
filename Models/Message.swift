//
//  Message.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 24/10/2024.
//

import Foundation

struct Message: Identifiable {
    let id: UUID = UUID()
    let text: String
    let user: User
}
