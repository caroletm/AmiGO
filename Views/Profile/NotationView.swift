//
//  ProfileView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 28/10/2024.
//

import SwiftUI

struct NotationView: View {
    @State private var buttonSad = false
    @State private var buttonBof = false
    @State private var buttonHappy = false
    @State private var buttonWink = false
    @State var clickimage: String
    @State var llamaface: String
    
    var body: some View {
        
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            
            VStack(alignment: .center){
                Image(.logoAmiGo)
                Spacer()
                Text("Merci d'avoir voyagé avec AmiGo")
                    .font(.custom("Poppins", size: 25))
                    .fontWeight(.semibold)
                    .padding(.top)
                    .multilineTextAlignment(.center)
                Spacer()
                
                
                Image(.myAvatar8)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180) // Ajuste la taille de l'image
                    .clipShape(Circle())
                Spacer()
                
                
                Text("Comment s'est passée ton expérience ?")
                    .font(.custom("Poppins", size: 25))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Spacer()
                
                
                
                
                VStack{
                    Spacer()
                    HStack(spacing: 10){
                        
                        NotationExtractedView(buttonSad: $buttonSad, llamaface: "lamanote1", clickimage: "hand.thumbsdown.fill" )
                        
                        NotationExtractedView(buttonSad: $buttonBof, llamaface: "lamanote2", clickimage: "smiley.fill" )
                        
                        NotationExtractedView(buttonSad: $buttonHappy, llamaface: "lamanote3", clickimage: "hand.thumbsup.fill" )
                        
                        NotationExtractedView(buttonSad: $buttonWink, llamaface: "lamanote4", clickimage: "hands.and.sparkles.fill" )


                    }
                    Spacer()
                    
                    NavigationLink {
                        ReportAmiGoView()
                    } label: {
                        Text("Signaler cet Amigo ?")
                            .font(.custom("Poppins", size: 18))
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                            .underline()
                            .padding()

                    }
                    
                }
            }
        }
    }
}

#Preview {
    NotationView(clickimage:"hands.thumbsup.fill", llamaface: "LlamaSad")
}




struct NotationExtractedView: View {
    @Binding var buttonSad: Bool
    var llamaface: String
    var clickimage: String
    var body: some View {
        ZStack{
            
            Button {
                buttonSad.toggle()
            } label: {
                    Image(llamaface)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)

                
            }
            
            if  buttonSad {
                
                Circle()
                    .frame(width: 80, height: 80)
                    .opacity(0.4)
                Image(systemName: clickimage)
                    .foregroundStyle(.orange)
                    .font(.title)
                
                
            }
            
            
        }
    }
}
