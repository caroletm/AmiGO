//
//  SearchResultView.swift
//  AmiGo
//
//  Created by Carole TREM on 29/10/2024.
//

import SwiftUI

struct SearchResultView: View {
    
    @Binding var departureStation: String
    @Binding var arrivalStation: String
    
    @State var nbAmiGos : Int = 0
    @State var bulleAide: Bool
    
    @State var showModal2 : Bool = false
    
    @Binding var notificationMessage: Int
    @Binding var notificationSearch : Int
    

    var body: some View {
        
        ZStack {
            
            Color.offWhite.ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    DepartArrivee(icon: "mappin2", station: departureStation, iconArrow: "arrow.up", colorArrow: .turquoise)
                    DepartArrivee(icon: "mappin", station: arrivalStation, iconArrow: "arrow.down", colorArrow: .darkOrange)
                    
                }.padding()
                
                VStack (alignment:.leading){
                    
                    Text(" \(usersTrip.count) AmiGOs autour de toi: ")
                        .font(.custom("Poppins-bold", size:20))
                    
                    Text("\(nbAmiGos) AmiGOs selectionnés sur 3")
                    
                        .onChange(of:nbAmiGos) {
                            if nbAmiGos >= 3 {showModal2 = true
                            }
                        }

                    ScrollView{
                        
//                        Liste de tous les voyages des AmiGOs a proximité
                        
                        ForEach(usersTrip) { eachUserTrip in
                            AmiGoResults(userTrip: eachUserTrip, nbAmiGos: $nbAmiGos, showModal2: $showModal2, boutonSelectionné: false)
                        }
                    }
                }.padding()
                
//                Extracted view du lama avec la bulle
                
                AideLama(textAide:"Choisis jusqu'a 3 AmiGOs avec qui tu pourrais voyager", bulleAide: true, imageLamaBoutton: "LlamaHappy")
                
                    .frame(width : 360, height: 80)
                
            }.padding()
        } .toolbar {
            ToolbarItem(placement: .principal) {
                Image("LogoAmiGo")
                    .resizable()
                    .scaledToFit()
            }
        }
        .sheet(isPresented: $showModal2) {
            
            LamaModal(llama: "LlamaSpeaking", information: "Les AmiGOs ont reçu ta demande. \r Tu seras prévenu quand elle sera acceptée. ", image: "peopleConnected", dissmissModal: $showModal2, notificationMessage: $notificationMessage, notificationSearch: $notificationSearch)
        }
    }
}

#Preview {
    
    SearchResultView(departureStation: .constant("Nation"), arrivalStation: .constant("CDG Etoile"), bulleAide: false, notificationMessage: .constant(0), notificationSearch: .constant(0))
}

//Extracted view des voyages AmiGOs a proximité

struct AmiGoResults: View {
   
    var userTrip : Trip
    @Binding var nbAmiGos : Int
    @Binding var showModal2 : Bool
    @State var boutonSelectionné : Bool = false
    
//    fonction pour changer l'état du bouton contacter AmiGO et le déselectionner si besoin
    func annulerDemande () -> String {
        return boutonSelectionné ? "Annuler" : "Contacter l'AmiGO"
    }
    
//    fonction qui incrémente ou décrémente le nb d'AmiGOs selectionnés
    func nbAmiGoSelection () {
        if boutonSelectionné {
            nbAmiGos += 1
        }else {
            nbAmiGos -= 1
        }
    }
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .foregroundColor(userTrip.user.gender == "female" ? .darkOrange : .turquoise)
                .opacity(0.25)
                .cornerRadius(5)
            
            HStack {
                Image(userTrip.user.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                
                ZStack{
                    Rectangle()
                        .opacity(0)
                    HStack{
                        VStack (alignment:.leading){
                            Text(userTrip.user.name)
                                .font(.custom("Poppins", size:16))
                                .fontWeight(.bold)
                            Text(userTrip.user.hobbies)
                                .font(.custom("Poppins", size:12))
                            Spacer()
                        }
                        Spacer()
                    }
                }
                ZStack {
                    Rectangle()
                        .opacity(0)
                        .frame(width:120)
                    VStack (alignment: .leading, spacing: 0){
                        Text("20 mins ensemble")
                        HStack{
                            Text("sur le")
                            Image(userTrip.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 20)
                        }
                        Text("jusqu'à " + userTrip.arrivalStation)
                        
                        Spacer()
                    }.font(.custom("Poppins", size:12))
                        .frame(height: 50)
                }
                
                Button {
        
                    boutonSelectionné.toggle()
                    nbAmiGoSelection()
                    
                }label:{
                    Text(annulerDemande())
                        .frame(width: 70, height: 70)
                        .padding(5)
                        .background(userTrip.user.gender == "female" ? .darkOrange : .turquoise)
                        .font(.custom("Poppins-bold", size:13))
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        
                }
            }
        }.frame(width: 380, height: 80)
    }
}

//Extracted View des destinations de départ et arrivée avec les icones

struct DepartArrivee: View {
    var icon : String
    var station : String
    var iconArrow : String
    var colorArrow : Color
    
    var body: some View {
        
        HStack{
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            ZStack{
                Rectangle()
                    .frame(width: 320, height: 30)
                    .foregroundColor(.white)
                HStack {
                    Text("\(station)")
                        .font(.custom("Poppins-Light", size:16))
                    Spacer()
                }
            }
            Image(iconArrow)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(colorArrow)
        }.padding(5)
    }
}

