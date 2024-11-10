//
//  LamaModal1.swift
//  AmiGo
//
//  Created by Carole TREM on 31/10/2024.
//

import SwiftUI

struct LamaModal: View {
    
    var llama: String
    var information: String
    var image: String
    var petitText:String = ""
    @Binding var dissmissModal : Bool
    @Binding var notificationMessage: Int
    @Binding var notificationSearch: Int
    
//    fonction qui ajoute une notif Message et qui enlève la notifSearch sur la tapBar
    func notifMessage() {
        notificationMessage = 1
        notificationSearch = 0
    }
    
    var body: some View {
        ZStack{
            Color.offWhite.ignoresSafeArea()
            VStack{
                Image(.logoAmiGo)

                Spacer()
                ZStack{
                    Image(llama)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                
                Text(information)
                    .font(.custom("Poppins-italic", size: 20))
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                Spacer()
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                Spacer()
                Text(petitText)
                
                Button {
                    dissmissModal.toggle()
                    notifMessage()
                } label: {
                    Text("OK")
                        .foregroundStyle(.darkOrange)
                        .font(.custom("Poppins-bold", size: 30))
                }
            }
        }
    }
}

#Preview {
    LamaModal(llama: "LlamaSmile", information: "Tu n'as pas encore trouvé ton AmiGO, choisis en 3 parmi la liste", image: "hand.rays", dissmissModal: .constant(true), notificationMessage: .constant(1), notificationSearch: .constant(0))
}
