//
//  ModalOpen.swift
//  AmiGo
//
//  Created by ALEX on 05/11/2024.
//
import SwiftUI
struct ModalOpen: View {
    
   @Binding var dismissModal1 : Bool
    
    var body: some View {
            ZStack {
                Color.offWhite.ignoresSafeArea(edges: .top)
                VStack(alignment:.center){
                    Image(.logoAmiGo)
                    Spacer()
                    ZStack{
                        Image(.llamaWink)
                            .resizable()
                            .frame(width: 300, height: 300)
                    }
                    
                    Spacer()
        Text("Félicitations ta demande d'AmiGO a été acceptée")
                        .font(.custom("Poppins-italic", size: 20))
                        .frame(width: 300)
                        Spacer()
                    Button("OK") {
                                   dismissModal1 = false
                                }
                    .foregroundStyle(.darkOrange)
                        .font(.custom("Poppins-bold", size: 30))

                }
            }

        }
    
    }
#Preview{
    ModalOpen(dismissModal1 : .constant(true))
}
