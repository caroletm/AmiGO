//
//  Trip.swift
//  AmiGo
//
//  Created by Carole Trem on 24/10/2024.
//

import Foundation

struct Trip: Identifiable {
    let id: UUID = UUID()
    let user: User
    let duration: Double
    let image: String
    let departureStation: String
    let arrivalStation: String
}

var caroleTrip = Trip(user:carole, duration: 10, image: "rerA", departureStation: "Joinville le Pont", arrivalStation: "Auber")
var alexandreTrip = Trip(user:alexandre, duration: 30, image: "rerA", departureStation: "Versailles", arrivalStation: "Gare du Nord")
var karlaTrip = Trip(user:karla, duration: 15, image: "rerA", departureStation: "Versailles", arrivalStation: "St Lazare")
var sebastienTrip = Trip(user:sebastien, duration: 15, image: "rerA", departureStation: "Nation", arrivalStation: "Fontainebleau")
var julesTrip = Trip(user:jules, duration: 20, image: "rerA", departureStation: "Nation", arrivalStation: "Montreuil")

var usersTrip = [caroleTrip,alexandreTrip, karlaTrip, sebastienTrip, julesTrip]
