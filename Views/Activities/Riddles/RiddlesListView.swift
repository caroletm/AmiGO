//
//  RiddlesListView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 29/10/2024.
//

import SwiftUI

struct RiddlesListView: View {
    let riddles: [ActivityGuess]
    
    @Binding var selectedRidle: ActivityGuess
    @Binding var showModal: Bool
    //@Binding var random: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(riddles) { riddle in
                    RoundedCornerBorderButton(text: riddle.theme, backgroundColor: riddle.color) {
                        selectedRidle = riddle
                        showModal = true
                    }
                }
            }
            .font(.custom("Poppins", size: 14))
            .fontWeight(.medium)
            .padding()
            .sheet(isPresented: $showModal) {
                ZStack {
                    Color.offWhite
                    RiddleModalView(riddle: $selectedRidle, showModal: $showModal)
                        .presentationDetents([.medium])
                        .padding(30)
                }
            }
        }
    }
}

#Preview {
    RiddlesListView(riddles: [
        ActivityGuess(question: "Quelle est la plus basse note de musique ?", answers: [], solution: "Fa, parce qu’elle est sous le sol.", theme: "Musique", color: .red)], selectedRidle: .constant(ActivityGuess(question: "Quelle est la plus basse note de musique ?", answers: [], solution: "Fa, parce qu’elle est sous le sol.", theme: "Musique", color: .red)), showModal: .constant(false))
}
