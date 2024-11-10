//
//  RiddleModalView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 30/10/2024.
//

import SwiftUI

struct RiddleModalView: View {
    @Binding var riddle: ActivityGuess
    @State var state: ActivityGuessState = .question
    @Binding var showModal: Bool
    
    var body: some View {
        Button {
            switch state {
            case .question:
                state = .answer
            case .answer:
                showModal = false
            }
        } label: {
            switch state {
            case .question:
                Text(riddle.question)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.creme)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.turquoise, lineWidth: 1)
                    )
                
            case .answer:
                Text(riddle.solution)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.lightTurquoise)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.turquoise, lineWidth: 1)
                    )
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
        }
        .foregroundStyle(.black)
        .rotation3DEffect(.degrees(state.rawValue), axis: (x: 0, y: 1, z: 0))
        .animation(.bouncy, value: state)
        .font(.custom("Poppins", size: 20))
        .fontWeight(.semibold)
        .overlay(alignment: .topTrailing) {
            Button {
                showModal = false
            } label: {
                Image(systemName: "multiply.circle")
                    .resizable()
                    .scaledToFit()
                    .symbolEffect(.bounce, value: state)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.black)
                    .background(.turquoise)
                    .clipShape(.circle)
            }
            .offset(x: 25, y: -25)
        }
    }
}

#Preview {
    RiddleModalView(riddle: .constant(ActivityGuess(question: "Quelle est la plus basse note de musique ?", answers: [], solution: "Fa, parce qu’elle est sous le sol.", theme: "Musique", color: .red)), showModal: .constant(true))
}
