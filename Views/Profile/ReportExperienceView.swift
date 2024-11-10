//
//  SwiftUIViewTextLama.swift
//  AmiGo
//
//  Created by Apprenant173 on 04/11/2024.
//

import SwiftUI

struct ReportExperienceView: View {
    @State var message = ""
    
    var body: some View {
        
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            VStack{
                Image(.logoAmiGo)
                Spacer()
                Text ("Partage-nous ton experience :")
                    .font(.custom("Poppins", size: 20))
                
                TextEditor(text:$message )
                    .font(.custom("Poppins", size: 17))
                    .keyboardType(.namePhonePad)
                    .padding()
                    .frame(width: 350, height: 300, alignment: .topLeading)
                    .scrollContentBackground(.hidden)
                    .background(.mint.opacity(0.2))
                    .cornerRadius(20)
                    .padding(16)
                
                Button() {
                    //action
                } label : {
                    Text("Envoyer")
                        .frame(width: 100, height: 50)
                    
                        .background(.lightTurquoise)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
}
#Preview {
    ReportExperienceView()
}
