
import SwiftUI
struct MessagesView: View {
    @State var message = ""
    @State var showModal1 : Bool = true
    @StateObject var allMessages = Messageries()
    @State var showModal2 : Bool = false
    @Binding var notificationActivity : Int
    @Binding var notificationMessage: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                
                MessageListView(allMessages: allMessages)
                
                MessageInputView(message: $message, allMessages: allMessages)
                
                ActionButtons(showModal2: $showModal2, notificationActivity:$notificationActivity, notificationMessage: $notificationMessage)
            }
            .padding()
            .background(Color("OffWhite").edgesIgnoringSafeArea(.top))
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
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented:$showModal1) {
                ModalOpen(dismissModal1: $showModal1)
            }
            .sheet(isPresented:$showModal2) {
                ModalSortie(dismissModal2: $showModal2, notificationActivity: $notificationActivity, notificationMessage: $notificationMessage)
                }
        }
    }
}

// Vue pour l'entête
struct HeaderView: View {
    var body: some View {
        ZStack {
            HStack {
                
                Image("myAvatar8")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    
            
                Spacer()
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .foregroundColor(.accentColor)
                        
                }
               
            }
            
            VStack {
                HStack {
                    
                    
                    Text("Jules")
                        .font(.custom("Poppins", size: 18))
                        .fontWeight(.bold)
                    
                    Text("Active")
                        .font(.custom("Poppins", size: 16))
                }
                .foregroundColor(.black)
            }
        }
        .padding(.all)
    }
}

// Vue pour la liste des messages
struct MessageListView: View {
    @ObservedObject var allMessages: Messageries
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(allMessages.messageries) { msg in
                    ChatBulle(msg: msg)
                }
            }
            .padding([.horizontal, .bottom])
            .padding(.top, 25)
            .background(Color("AccentColor").opacity(0.07))
            .cornerRadius(20)
        }
    }
}

// Vue pour le champ de saisie des messages
struct MessageInputView: View {
    @Binding var message: String
    @ObservedObject var allMessages: Messageries
    
    var body: some View {
        HStack(spacing: 15) {
            TextField("message", text: $message)
                .font(.custom("Poppins", size: 18))
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color.black.opacity(0.06))
                .clipShape(Capsule())
            
            Button(action: {
                // Ajout d'un message...
                allMessages.messageries.append(Messagerie(id: Date(), mssge: message, myMsg: true, profilePic: "myAvatar"))
                message = ""
            }) {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 22))
                    .foregroundColor(Color("AccentColor"))
                    .rotationEffect(.init(degrees: 45))
                    .background(Color.black.opacity(0.10))
                    .clipShape(Circle())
            }
            .padding(.leading, 12)
        }
        .padding(.horizontal)
    }
}

// Vue pour les boutons d'action

struct ActionButtons: View {
    
    @Binding var showModal2 : Bool
    @State var isNotationViewPresented : Bool = false
    @Binding var notificationActivity : Int
    @Binding var notificationMessage : Int
    
//    fonction qui remet à 0 les notifs Activity et Message dans la tapbar quand le trajet est terminé
    
    func removeNotifActivity () {
        notificationActivity = 0
        notificationMessage = 0
    }
    
    
    var body: some View {
        
        HStack {
            Button {
                
                showModal2.toggle()
                
            } label: {
                Text("Bravo tu as retrouvé ton amigo")
                    .frame(width: 150, height: 60)
                    .background(Color("Turquoise"))
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .font(.custom("Poppins", size: 15))
            }
            
//            Bouton qui donne acces à la vue Notation et qui remet 0 les notifications de la tapBar
            
            Button {
                isNotationViewPresented = true
                removeNotifActivity()
                
            } label:{
                Text("Le voyage est terminé")
                    .frame(width: 150, height: 60)
                    .background(Color("AccentColor"))
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .font(.custom("Poppins", size: 15))
            }
            .navigationDestination(isPresented: $isNotationViewPresented) {
                NotationView(clickimage: "", llamaface: "")
            }
        }
    }
}


// Bubble Arrow
struct BubbleArrow: Shape {
    var myMsg: Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: myMsg ?[.topLeft,.bottomLeft, .bottomRight] : [.topRight, .bottomLeft, .bottomRight] , cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
    }
}
struct ChatBulle : View {
    var msg: Messagerie
    var body: some View {
        HStack(alignment: .top,spacing: 10) {
            if msg.myMsg {
                // pousser le message vers la gauche
                
                // espace minimum ...
                Spacer(minLength: 25)
                Text(msg.mssge)
                    .font(.custom("Poppins", size: 15))
                    .padding(.all)
                    .background(Color.black.opacity(0.10))
                    .clipShape(BubbleArrow(myMsg: msg.myMsg))
                // Image de profile
                
                Image(msg.profilePic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            }
            else{
                // pousser le message à droite...
                // Image de profile ...
                Image(msg.profilePic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text(msg.mssge)
                    .foregroundColor(.white)
                    .padding(.all)
                    .background(Color("AccentColor"))
                    .clipShape(BubbleArrow(myMsg: msg.myMsg))
               
                Spacer(minLength: 25)
               
            }
                
            }
        }
    }

// forme arrondie personnalisée
struct RoundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
// données de modèle pour le message

struct Messagerie: Identifiable {
    var id: Date
    var mssge: String
    var myMsg: Bool
    var photo: Data?
    var profilePic: String
    
}

class Messageries : ObservableObject {
    @Published var messageries: [Messagerie] = []
    //  Exemple de données(message)
    init() {
        let strings = ["Hii","Hello!!!","Grâce à Amigo, on sait maintenant qu’on partage la même ligne de transport,  Ça te dit qu’on fasse un peu connaissance en attendant la prochaine station ?", "Hello ! Oui, on dirait bien ! Tu as découvert Amigo depuis longtemps ?","Non, récemment"]
        for i in 0..<strings.count{
            // logique pour une vue des messages sur les côtés ...
            messageries.append(Messagerie(id: Date(), mssge: strings[i], myMsg: i % 2 == 0 ? true : false, profilePic: i % 2 == 0 ? "myAvatar3" : "myAvatar8"))
        }
    }
    func writeMessage(id: Date, msg: String, photo: Data?, myMsg: Bool, profilePic: String) {
        messageries.append(Messagerie(id: id, mssge: msg, myMsg: myMsg, photo: photo, profilePic: profilePic))
    }
}

#Preview {
    MessagesView(notificationActivity:.constant(1), notificationMessage: .constant(1))
}






