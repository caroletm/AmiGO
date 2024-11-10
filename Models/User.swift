//
//  User.swift
//  AmiGo
//
//  Created by Carole Trem on 24/10/2024.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let gender : String
    let image: String
    let hobbies: String
    let nbTrips: Int
    let favoriteStations: [String]
}

var carole = User(name:"Carole", gender: "female", image:"myAvatar",hobbies:"Tennis, Cuisine",nbTrips:5,favoriteStations:["Nation", "Bastille"])
var alexandre = User(name:"Alexandre", gender: "male", image:"myAvatar7",hobbies:"Sport",nbTrips:2,favoriteStations:["Gare du Nord"])
var karla = User(name:"Camille", gender: "female", image:"myAvatar2",hobbies:"Lecture",nbTrips:1,favoriteStations:["St Lazare"])
var sebastien = User(name:"Sebastien", gender: "male", image:"myAvatar6",hobbies:"Informatique",nbTrips:1,favoriteStations:["Fontainebleau"])
var jules = User(name:"Jules", gender: "male", image:"myAvatar8",hobbies:"Cinéma",nbTrips:1,favoriteStations:["Montreuil"])

var users = [carole, alexandre, karla, sebastien, jules]
