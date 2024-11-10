//
//  PierreFeuilleCiseaux.swift
//  AmiGo
//
//  Created by Carole TREM on 31/10/2024.
//

import SwiftUI

struct PierreFeuilleCiseauxView: View {
    
    @State var amiGO1 = ""
    @State var amiGO2 = ""
    var choix : [String] = ["✊", "👋", "✌️"]
    @State var scoreAmiGO1 = 0
    @State var scoreAmiGO2 = 0
    @State var showModal = false
    @State var winner = ""
    @State var result: String = "C'est parti!"
    @State var nomAmiGO1: String = "Karla"
    @State var nomAmiGO2: String = "Jules"
    
    
//    fonction pour générer un choix au hasard pour chaque amigo
    
    func generateChoice() -> String {
        return choix.randomElement()!
    }
    
//    fonction qui donne le resultat de la manche dans le texte bleu au milieu
    
    func resultat () {
        result =
        if amiGO1 == "" && amiGO2 == "" {
            "C'est parti !"
        }
        else if amiGO1 == amiGO2 {
            "Egalité"
        }else if amiGO1 == "✊" && amiGO2 == "👋" || amiGO1 == "👋" && amiGO2 == "✌️" || amiGO1 == "✌️" && amiGO2 == "✊" {
            " Bravo \(nomAmiGO2) !"
        } else {
            " Bravo \(nomAmiGO1) ! "
        }
    }
    
//    fonction qui sert a incrémenter les scores selon le gagnant de la manche
    func score () {
    
        if amiGO1 == amiGO2 {
        } else if amiGO1 == "✊" && amiGO2 == "👋" || amiGO1 == "👋" && amiGO2 == "✌️" || amiGO1 == "✌️" && amiGO2 == "✊" {
            scoreAmiGO2 += 1
        } else {
            scoreAmiGO1 += 1
        }
    }
    
//    fonction qui sert a donner le nom du gagnant de chaque partie et d'afficher la modale de Victoire. Pour gagner 1 partie il faut gagner 3 manches.
    
    func decideWinner () {
        if scoreAmiGO1 == 3{
            winner = nomAmiGO1
            showModal.toggle()
        }
        else if scoreAmiGO2 == 3{
            winner = nomAmiGO2
            showModal.toggle()
        }
    }
    
//    fonction qui sert a lancer le jeu dans le bouton Jouer qui prend en compte les choix des joueurs, l'incrémentation du score, le nom du gagnant et l'affichage du resultat dans le texte bleu au milieu
    
    func lancerJeu() {
        amiGO1 = generateChoice()
        amiGO2 = generateChoice()
        score()
        decideWinner()
        resultat()
    }
    
    var body: some View {
        
        ZStack{
            Color.offWhite.ignoresSafeArea()
            
            VStack (spacing:30){
                
                VStack{
                    Text(" \(nomAmiGO1) \rscore : \(scoreAmiGO1)")
                        .font(.custom("Poppins", size: 22))
                    Text(amiGO1)
                        .padding()
                        .font(.custom("Poppins-bold", size: 70))
                        .animation(.easeInOut, value: amiGO1)
                        .frame(width: 100, height: 100)
                }
                
                Text(result)
                    .font(.custom("Poppins-bold", size: 24))
                    .foregroundStyle(.turquoise)
                    .animation(.easeInOut, value: result)
                    
                
                VStack {
                    Text(amiGO2)
                        .padding()
                        .font(.custom("Poppins-bold", size: 70))
                        .animation(.easeInOut, value: amiGO2)
                        .frame(width: 100, height: 100)
                    Text(" \(nomAmiGO2) \rscore : \(scoreAmiGO2)")
                        .font(.custom("Poppins", size: 22))
                }
//                bouton Jouer qui prend en compte les choix des joueurs, l'incrémentation du score, le nom du gagnant et l'affichage du resultat dans le texte bleu au milieu
                
                Button {
                    lancerJeu()
                    
                } label:{
                    Text("Jouer")
                        .font(.custom("Poppins-bold", size: 24))
                        .padding()
                        .background(Color.darkOrange)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    
                }
            }
        }
        .sheet(isPresented: $showModal) {ModalVictoire(dissmissModal: $showModal, winner: $winner, scoreAmiGO1: $scoreAmiGO1, scoreAmiGO2: $scoreAmiGO2)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    ReportAmiGoView()
                } label: {
                    Image("danger")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }

            }
        }
    }
    
}

#Preview {
    PierreFeuilleCiseauxView()
}
