//
//  ModalSortie.swift
//  AmiGo
//
//  Created by ALEX on 05/11/2024.
//

import SwiftUI

struct ModalSortie : View{
    
    @Binding var dismissModal2: Bool
    @Binding var notificationActivity: Int
    @Binding var notificationMessage : Int
    
//    fonction qui ajoute la notification Activity et qui enlève la notification Message dans la tapBar
    
    func notifActivity () {
        notificationActivity = 1
        notificationMessage = 0
    }
    
    var body: some View {
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            VStack{
                Image(.logoAmiGo)
                Spacer()
                ZStack{
                    Image(.llamaSunglasses)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                
                Spacer()
                Text("Bravo! Tu as trouvé ton AmiGO, place au fun !")
                    .font(.custom("Poppins-italic", size: 20))
                    .frame(width: 300)
                Spacer()
                Image(.handThumbsup)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                Spacer()
                Button("OK") {
                    dismissModal2 = false
                    notifActivity()
                }
                .foregroundStyle(.darkOrange)
                    .font(.custom("Poppins-bold", size: 30))
            }
        }
    }
}




#Preview{
    ModalSortie(dismissModal2 : .constant(false), notificationActivity: .constant(1), notificationMessage: .constant(1))
}
