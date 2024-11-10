//
//  ActivitiesTabView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 29/10/2024.
//

import SwiftUI

struct ActivitiesTabView: View {
    @State var selectedActivity: Activity = .riddle
    @Binding var random: Bool
    
    var body: some View {
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            VStack {
                ActivityPicker(selection: $selectedActivity, random: $random)
                    .frame(maxHeight: .infinity)
                Button {
                    selectedActivity = Activity.allCases.randomElement()!
                    random = true
                } label: {
                    Text("On choisit pour toi")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.darkOrange)
                        .clipShape(.rect(cornerRadius: 10))
                }.padding(.bottom)
            }
            .padding(.top)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("LogoAmiGo")
                    .resizable()
                    .scaledToFit()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    ReportAmiGoView()
                } label: {
                    Image("danger")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }

            }
        }
    }
}

#Preview {
    ActivitiesTabView(random: .constant(false))
}
