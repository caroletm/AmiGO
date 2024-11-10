//
//  SearchView.swift
//  AmiGo
//
//  Created by Carole Trem on 28/10/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var departureStation: String = ""
    @State var arrivalStation: String = ""
    @State var isSearchViewResultPresented: Bool = false
    @Binding var notificationSearch: Int
    @Binding var notificationMessage: Int
    
    func notifSearch() {
        notificationSearch = 1
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.offWhite.ignoresSafeArea(edges: .top)
                
                VStack {
                    
                    VStack(alignment:.leading){
                        
                        Text("Départ")
                            .font(.custom("Poppins", size: 20))
                        
                        ExtractedTextField(departArrivee : "Depart", station2 : $departureStation)
                        
                        Text("Arrivée")
                            .font(.custom("Poppins", size: 20))
                        
                        ExtractedTextField(departArrivee : "Arrivée", station2 : $arrivalStation)
                        
                    }.padding()
                    
//bouton Go qui donne acces la page SearchViewResults + qui donne la notif Search sur la tapBar :
                    
                    Button {

                        isSearchViewResultPresented = true
                        notifSearch()
                        
                    } label:{
                        Text("Go")
                    }
                    .padding()
                    .foregroundStyle(Color.white)
                    .background(Color.darkOrange)
                    .fontWeight(.bold)
                    .font(.custom("Poppins", size:20))
                    .cornerRadius(10)
                    .disabled(departureStation.isEmpty || arrivalStation.isEmpty)
                    
                    Spacer()
                    
                    AideLama(textAide:"Hola!\rDonne plus d'infos sur\rton trajet et je vais t'aider à trouver des AmiGOs ! ", bulleAide: true, imageLamaBoutton: "LlamaHappy")
                        .frame(width : 360, height: 130)
                    
                }.padding()
                
            }
            .navigationDestination(isPresented: $isSearchViewResultPresented, destination: {
                SearchResultView(departureStation:$departureStation , arrivalStation: $arrivalStation, bulleAide: true, notificationMessage: $notificationMessage, notificationSearch: $notificationSearch)
            })
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("LogoAmiGo")
                        .resizable()
                        .scaledToFit()
                }
            }
            .navigationTitle("Recherche")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    SearchView(notificationSearch: .constant(1), notificationMessage: .constant(1))
}

//Vue extraite des textfields qui sont stockés dans la variable station 2

struct ExtractedTextField: View {
    
    var departArrivee : String = "Depart"
    @Binding var station2 : String
    
    var body: some View {
        
        TextField(departArrivee, text: $station2)
            .padding()
            .font(.custom("Poppins", size: 18))
            .frame(width:350, height :30 )
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.turquoise, lineWidth: 1)
            )
    }
}
