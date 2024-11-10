//
//  QuizzModal.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 31/10/2024.
//

import SwiftUI

struct QuizzModalView: View {
    @Binding var quizz: ActivityGuess
    @State var state: ActivityGuessState = .question
    @Binding var showModal: Bool
    @State var isCorrect: Bool? = nil
    
    var body: some View {
        VStack {
            VStack {
                switch state {
                case .question:
                    Text(quizz.question)
                case .answer:
                    Button {
                        showModal = false
                    } label: {
                        Text(quizz.solution)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(isCorrect == nil ? .creme : isCorrect == true ? .green : .red)
            .clipShape(.rect(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.turquoise, lineWidth: 1)
            )
            .foregroundStyle(.black)
            .rotation3DEffect(.degrees(state.rawValue), axis: (x: 0, y: 1, z: 0))
            .animation(.bouncy, value: state)
            .font(.custom("Poppins", size: 20))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            HStack {
                ForEach(quizz.answers) { answer in
                    Button {
                        if (state == .question) {
                            state = .answer
                            isCorrect = answer.isCorrect
                        }
                    } label: {
                        Text(answer.answer)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.lightTurquoise)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.turquoise, lineWidth: 1)
                            )
                            .font(.custom("Poppins", size: 20))
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
            }
            .disabled(isCorrect != nil)
        }
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
    QuizzModalView(quizz: .constant(ActivityGuess(question: "Les chauves-souris vampires se nourrissent exclusivement de sang. Vrai ou faux ?", answers: [
        ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
        ActivityGuessAnswer(answer: "Faux", isCorrect: false)
    ], solution: "Il existe 3 espèces de chauves-souris vampires et elles se  nourrissent exclusivement de sang. On les trouve uniquement en Amérique centrale et en Amérique du Sud. Ces animaux peuvent transmettre la rage par morsure.", theme: "Chauves-Souris", color: .red)), showModal: .constant(true))
}
