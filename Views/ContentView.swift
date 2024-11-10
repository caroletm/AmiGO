//
//  ContentView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 24/10/2024.
//  Modified by Carole Trem on 06/11/2024

import SwiftUI

struct ContentView: View {
    
//    variables pour afficher les notifications dans la tapBar
    
    @State private var notificationSearch: Int  = 0
    @State private var notificationMessage: Int = 0
    @State private var notificationActivity: Int = 0
  
        var body: some View {
            ZStack {
                
                TabView {
                    SearchView(notificationSearch: $notificationSearch, notificationMessage: $notificationMessage)
                        .tabItem {
                            Label("Recherche", image: "magnifyingglass")
                        }.badge(notificationSearch)
                    
                    MessagesView(notificationActivity:$notificationActivity, notificationMessage: $notificationMessage)
                        .tabItem {
                            Label("Messages", image: "message")
                        }.badge(notificationMessage)
                    
                    ActivitiesView()
                        .tabItem {
                            Label("Activités", image: "dice")
                        }.badge(notificationActivity)
                    ProfileView()
                        .tabItem {
                            Label("Profil", image: "person")
                        }
                }
            }
        }
    }
#Preview {
    ContentView()
}
