//
//  PFC Victoire Modal .swift
//  AmiGo
//
//  Created by Carole TREM on 04/11/2024.
//

import SwiftUI

struct ModalVictoire: View {
    
    @Binding var dissmissModal : Bool
    @Binding var winner : String
    @Binding var scoreAmiGO1 : Int
    @Binding var scoreAmiGO2 : Int
    
    var body: some View {
        
        ZStack{
            Color.offWhite.ignoresSafeArea()
            
            VStack(spacing: 40){
                
                Text("\(winner) a gagné la partie !")
                    .font(.custom("Poppins-bold", size: 24))
                
                Image("VictoireAmigo")
                
//                Bouton qui permet de fermer la modale, de rejouer la partie et de remettre les scores à 0
                
                Button {
                    dissmissModal.toggle()
                    scoreAmiGO1 = 0
                    scoreAmiGO2 = 0
                    
                } label: {
                    Text("Rejouer")
                        .padding()
                        .background(Color.darkOrange)
                        .foregroundStyle(.white)
                        .font(.custom("Poppins-bold", size: 24))
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ModalVictoire(dissmissModal: .constant(true), winner: .constant("AmiG01"),scoreAmiGO1:.constant(0),scoreAmiGO2:.constant(0))
}
