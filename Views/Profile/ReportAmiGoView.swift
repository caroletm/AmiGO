//
//  SwiftUIView Lama5.swift
//  AmiGo
//
//  Created by Apprenant173 on 04/11/2024.
//

import SwiftUI

struct ReportAmiGoView: View {
    var body: some View {
        
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            
        VStack{
                Image(.logoAmiGo)
                Spacer()
        ZStack{
            Image("LlamaSad")
            .resizable()
       .frame(width: 300, height: 300)
                }
                
            Text("Faut-il signaler cet AmiGo ? ")
                    .font(.title2)
                    .italic()
                    .frame(width: 300)
                Spacer()
            HStack{
                
                NavigationLink (destination : ReportExperienceView()) {
                    Text("Oui")
                }
            .frame(width: 100, height: 50)
            .background(.accent)
            .cornerRadius(20)
            .foregroundColor(.white)
                
                Button() {
                    //action
                } label : {
        Text("Non")
        .frame(width: 100,height: 50)
        .background(.lightTurquoise)
        .cornerRadius(20)
        .foregroundColor(.white)}
                
                    }
                } .padding()
            }
        }
     }
    #Preview {
        NavigationStack { ReportAmiGoView()
        }
    }

