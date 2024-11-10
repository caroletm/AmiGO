//
//  AideLama.swift
//  AmiGo
//
//  Created by Carole TREM on 30/10/2024.
//

import SwiftUI

struct AideLama: View {
    
    var textAide: String
   @State var bulleAide: Bool
    var imageLamaBoutton: String
    
    var body: some View {
        HStack {
            
            if bulleAide {
                ZStack {
                    
                    SpeechBubbleRight(radius: 20)
                        .fill(Color.white)
                        .stroke(Color.gray, lineWidth: 3)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                    
                    Text(textAide)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.light)
                        .padding()
                        //.frame(width: 200, height: 100)
                }
            }
            else {
                Spacer()
            }
            Button {
                bulleAide.toggle()
            } label: {
                Image(imageLamaBoutton)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .rotationEffect(.degrees(-25))
            }
        }.padding(.horizontal, 5)
    }
}

#Preview {
    AideLama(textAide: "Aide-moi", bulleAide: true, imageLamaBoutton: "LlamaHappy")
}
