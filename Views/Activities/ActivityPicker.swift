//
//  ActivityPicker.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 30/10/2024.
//

import SwiftUI

struct ActivityPicker: View {
    let riddles: [ActivityGuess] = [
        ActivityGuess(question: "Quelle est la plus basse note de musique ?", answers: [], solution: "Fa, parce qu’elle est sous le sol.", theme: "Musique", color: .creme),
        ActivityGuess(question: "Pourquoi les plongeurs plongent-ils en arrière ?", answers: [], solution: "Parce que s’ils plongeaient en avant ils tomberaient dans le bateau.", theme: "Plongeur", color: .lightTurquoise),
        ActivityGuess(question: "Que se disent deux bonhommes de neige qui se croisent ?", answers: [], solution: "« Tu trouves pas que ça sent la carotte aujourd’hui ? »", theme: "Bonhomme de neige", color: .creme),
        ActivityGuess(question: "Comment le boulanger range ses pains au chocolat ?", answers: [], solution: "Dans l’ordre des croissants.", theme: "Boulanger", color: .lightTurquoise),
        ActivityGuess(question: "Quatre éléphants sont dans une voiture. Lequel conduit ?", answers: [], solution: "Celui qui a le permis.", theme: "Éléphant", color: .creme),
        ActivityGuess(question: "Qu'est ce qui a 118 yeux et 7 dents ?", answers: [], solution: "Un autobus rempli de personnes âgées.", theme: "Yeux et dents", color: .lightTurquoise),
        ActivityGuess(question: "Qu'est-ce qu'on trouve dans un nez bien propre ?", answers: [], solution: "Des empreintes digitales.", theme: "Nez", color: .creme),
        ActivityGuess(question: "Combien de fois des gens se sont jetés du haut de la Tour Eiffel ?", answers: [], solution: "Une seule fois chacun.", theme: "Tour Eiffel", color: .lightTurquoise),
        ActivityGuess(question: "Pourquoi un fermier ne peut se marier avec une fille prénommée Claire ?", answers: [], solution: "Parce que la ferme tuerait Claire.", theme: "Fermier", color: .creme),
        ActivityGuess(question: "Quel animal a trois bosses ?", answers: [], solution: "Un chameau qui s’est cogné.", theme: "Animal", color: .lightTurquoise),
    ]
    
    let quizzes: [ActivityGuess] = [
        ActivityGuess(question: "Les chauves-souris vampires se nourrissent exclusivement de sang. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "Il existe 3 espèces de chauves-souris vampires et elles se  nourrissent exclusivement de sang. On les trouve uniquement en Amérique centrale et en Amérique du Sud. Ces animaux peuvent transmettre la rage par morsure.", theme: "Chauves-Souris", color: .turquoise),
        ActivityGuess(question: "Les gorilles et les humains partagent plus de 98% du patrimoine génétique. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "Le gorille est une espèce de singe proche des humains avec un taux de ressemblance génétique de plus de 98,5% mais le bonobo et le chimpanzé sont encore plus proches des humains à presque 99%.", theme: "Gorilles", color: .accent),
        ActivityGuess(question: "Lorsqu'il fait du bruit, on dit que l'éléphant vagit. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "Un éléphant barrit et fait des barrissements. Ce sont les lièvres ou les crocodiles qui vagissent.", theme: "Éléphants", color: .turquoise),
        ActivityGuess(question: "Il a été prouvé que tous les ours polaires sont des gauchers. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "C'est une fausse information qui a longtemps circulé à propos des ours polaires, mais ces animaux utilisent leurs pattes gauches et droites de manière égale, on peut donc dire qu'ils sont ambidextres.", theme: "Ours polaires", color: .accent),
        ActivityGuess(question: "Le toucan possède la particularité d'avoir un très petit bec comparé à sa taille. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "C'est l'inverse, le toucan est réputé pour son grand bec généralement coloré.", theme: "Toucans", color: .turquoise),
        ActivityGuess(question: "Une tortue marine peut rester sous l'eau pendant 7 heures sans reprendre d'oxygène. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "Lorsque les tortues dorment, elles dépensent très peu d’oxygène, elles peuvent alors rester sous l’eau pendant 4 à 7h.", theme: "Tortues marine", color: .accent),
        ActivityGuess(question: "Le chat ayant vécu le plus longtemps est mort à l'âge de 38 ans. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "Ce chat nommé Cream Puff a vécu 38 ans de 1967 à 2005, rapporté à l'âge humain, cela correspond à 169 ans. En moyenne les chats vivent 12 à 14 ans.", theme: "Chats", color: .turquoise),
        ActivityGuess(question: "Le yack est un animal qui vit en Amérique du Sud. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "Le yack est un animal que l'on trouve dans toute la région himalayenne du Gilgit-Baltistan (Cachemire, Pakistan), au Népal, sur le plateau tibétain et jusqu'en Mongolie et en Sibérie au nord. Il n'est donc pas naturellement présent en Amérique du Sud.", theme: "Yacks", color: .accent),
        ActivityGuess(question: "Chez les lucioles, seuls les mâles brillent dans la nuit pour attirer les femelles. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "Les mâles et les femelles lucioles brillent. Les femelles brillent même davantage que les mâles pour les attirer.", theme: "Lucioles", color: .turquoise),
        ActivityGuess(question: "Les guêpes sont des insectes généralement plus longs que les abeilles. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "L'abeille est petite et trapue alors que la guêpe est plus profilée, longue et possède un abdomen séparé du thorax d'où l'expression « avoir une taille de guêpe ».", theme: "Guêpes", color: .accent),
    ]
    
    @Binding var selection: Activity
    @Binding var random: Bool
    @State var selectedRiddle: ActivityGuess
    @State var showRiddleModal: Bool = false
    @State var selectedQuizz: ActivityGuess
    @State var showQuizzModal: Bool = false
    
    init(selection: Binding<Activity>, random: Binding<Bool>) {
        self._selection = selection
        self._random = random
        self.selectedRiddle = riddles[0]
        self.selectedQuizz = quizzes[0]
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Activity.allCases, id: \.self) { activity in
                    Button {
                        selection = activity
                    } label: {
                        Text(activity.rawValue)
                            .padding()
                            .background(selection == activity ? Color.darkOrange : .gray)
                            .clipShape(.rect(cornerRadius: 10))
                            .foregroundStyle(.white)
                            .font(.custom("Poppins", size: 14))
                    }
                }
            }.padding(.horizontal)
            TabView(selection: $selection) {
                RiddlesListView(riddles: riddles, selectedRidle: $selectedRiddle, showModal: $showRiddleModal).tag(Activity.riddle)
                QuizzesListView(quizzes: quizzes, selectedQuizz: $selectedQuizz, showModal: $showQuizzModal).tag(Activity.quizz)
                GamesListView().tag(Activity.game)
                SubjectConvsView().tag(Activity.subjectConv)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .animation(.easeInOut, value: selection)
            .onAppear {
                manageRandom(random: $random)
            }
            .onChange(of: random) {
                manageRandom(random: $random)
            }
        }
    }
    
    private func manageRandom(random: Binding<Bool>) {
        print(random.wrappedValue)
        if (random.wrappedValue) {
            if (selection == .riddle) {
                selectedRiddle = riddles.randomElement()!
                showRiddleModal = true
            }
            else if (selection == .quizz) {
                selectedQuizz = quizzes.randomElement()!
                showQuizzModal = true
            }
            random.wrappedValue = false
        }
    }
}

#Preview {
    ActivityPicker(selection: .constant(.riddle ), random: .constant(false))
}
