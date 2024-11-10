//
//  GamesListView.swift
//  AmiGo
//
//  Created by Carole Trem on 30/10/2024.
//

import SwiftUI


struct GamesListView: View {
    
    var body: some View {
        
        ZStack {
            Color.offWhite.ignoresSafeArea()
            
            VStack{
                
                ScrollView {
                    
                    NavigationLink (destination:PierreFeuilleCiseauxView()) {
                        OptionJeux(nameJeu: "Pierre, Feuille Ciseaux", imageJeu : "LlamaPierreFeuilleCiseaux", colorJeu:.turquoise)
                    }
                    NavigationLink (destination:TicTacToeView()) {
                        OptionJeux(nameJeu: "Tic, Tac, Toe", imageJeu : "LlamaTicTacToe", colorJeu:.darkOrange)
                    }
                    
                    OptionJeux(nameJeu: "Pendu", imageJeu : "LlamaPendu", colorJeu:.turquoise)
                    OptionJeux(nameJeu: "Jeu de Mémoire", imageJeu : "LlamaMemoire", colorJeu:.darkOrange)
                }
            }
        }
        .navigationTitle("Jeux")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        GamesListView()
    }
}

//Extracted View des boutons pour accéder au jeux

struct OptionJeux: View {
    
    var nameJeu : String
    var imageJeu : String
    var colorJeu : Color
    
    var body: some View {
        
            ZStack{
                Rectangle()
                    .frame(width: 360, height : 140)
                    .cornerRadius(15)
                    .foregroundStyle(colorJeu)
                    .opacity(0.6)
                
                HStack{
                    Text(nameJeu)
                        .font(.custom("Poppins-bold", size: 20))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(imageJeu)
                }.padding()
                    .frame(width: 360, height : 150)
        }
    }
}
