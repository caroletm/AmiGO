//
//  SubjectConvsView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 30/10/2024.
//
import SwiftUI

struct SubjectConvsView: View {
    var sujet =  ["💭 La chose la plus drôle que tu aies vue dans les transports ?", "💭 Une passion ou un hobby dont tu ne pourrais pas te passer ?","💭 Quel est ton premier souvenir d'enfance ?","💭 Si tu pouvais avoir un superpouvoir dans les transports, ce serait quoi ?", "💭 Si tu pouvais passer une heure à faire tout ce que tu voulais, Que choisirais-tu de faire", "💭 Si tu pouvais te réveiller dans un autre pays demain, lequel choisirais-tu ?", "💭 Quelle est la destination la plus marquante que tu aies visitée ?", "💭 Quels livres ont eu la plus grande influence sur toi ?"]
    
    var body: some View {
        ZStack {
            Color.offWhite
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0) {
                Text("Parlons en chemin 💬")
                    .font(.custom("Poppins", size: 25))
                    .fontWeight(.semibold)
                ScrollView {
                    ForEach(self.sujet, id: \.self) { sujet in
                        Text(sujet)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom("Poppins", size: 18))
                            .padding()
                            .background(Color.lightTurquoise)
                            .clipShape(.rect(cornerRadius: 10))
                            .multilineTextAlignment(.leading)
                    }
                }
                .scrollIndicators(.hidden)
            }.padding([.horizontal, .top])
            
        }
    }
}

#Preview {
    SubjectConvsView()
}


