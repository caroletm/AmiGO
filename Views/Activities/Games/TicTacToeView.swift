//
//  TicTacToeView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 05/11/2024.
//

import SwiftUI

struct TicTacToeView: View {
    @State var board: [[String]] = [
        [
            "", "", ""
        ],
        [
            "", "", ""
        ],
        [
            "", "", ""
        ]
    ]
    
    let playerOne = TicTacToePlayer(name: "Karla", image: "Player1")
    let playerTwo = TicTacToePlayer(name: "Jules", image: "Player2")
    
    @State var player: TicTacToePlayer
    @State var winner: TicTacToePlayer? = nil
    @State var presentWinModal: Bool = false
    @State var presentPlayAgainsIAModal: Bool = true
    @State var playAgainIA: Bool = false
    
    init() {
        self.player = playerOne
    }
    
    var body: some View {
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: [.top])
            VStack {
                Text("Tour de \(player.name)")
                    .font(.custom("Poppins", size: 30))
                    .fontWeight(.bold)
                Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                    ForEach(board.indices, id: \.self) { row in
                        GridRow {
                            ForEach(board[row].indices, id: \.self) { column in
                                Button {
                                    board[row][column] = player.image
                                    winner = checkWinner(board: board)
                                    if (winner == nil && isMoveLeft(board: board)) {
                                        if (playAgainIA) {
                                            player = playerTwo
                                            makeMove(board: board)
                                        } else if (player == playerOne) {
                                            player = playerTwo
                                        } else {
                                            player = playerOne
                                        }
                                    }
                                    else if (winner != nil) {
                                        presentWinModal = true
                                    }
                                } label: {
                                    Image(board[row][column])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .padding()
                                }
                                .border(3, edges: {
                                    var edges: [Edge] = []
                                    if row != 0 {
                                        edges.append(.top)
                                    }
                                    if (row != board.count - 1) {
                                        edges.append(.bottom)
                                    }
                                    if (column != 0) {
                                        edges.append(.leading)
                                    }
                                    if (column != board[row].count - 1) {
                                        edges.append(.trailing)
                                    }
                                    return edges
                                }(), color: .darkOrange)
                                .disabled(!board[row][column].isEmpty || (player != playerOne && playAgainIA) || (winner != nil && isMoveLeft(board: board)))
                            }
                        }.frame(width: 100, height: 100)
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 40)
                Button {
                    restartGame()
                } label: {
                    Text("Recommencer ?")
                        .font(.custom("Poppins", size: 20))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.darkOrange)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }.sheet(isPresented: $presentWinModal) {
                ModalVictoire(dissmissModal: $presentWinModal, winner: Binding(get: {
                    winner?.name ?? ""
                }, set: { _, _ in }), scoreAmiGO1: Binding(get: { 0 }, set: { _ in
                    restartGame()
                }), scoreAmiGO2: .constant(0))
            }.sheet(isPresented: $presentPlayAgainsIAModal) {
                VStack(spacing: 30) {
                    HStack {
                        Toggle(isOn: $playAgainIA) {
                            Text("Jouer contre une IA ?")
                                .font(.custom("Poppins", size: 20))
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background(Color.creme)
                        .clipShape(.rect(cornerRadius: 10))
                    }
                    Button {
                        presentPlayAgainsIAModal = false
                    } label: {
                        Text("Ok")
                            .font(.custom("Poppins", size: 20))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.turquoise)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                }
                .frame(width: 220)
                .padding()
                .presentationDetents([.height(250)])
            }
            .toolbar {
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
    
    func isMoveLeft(board: [[String]]) -> Bool {
        for row in board {
            for col in row {
                if (col.isEmpty) {
                    return true
                }
            }
        }
        return false
    }
    
    func evaluateBoard(board: [[String]]) -> Int {
        var firstDiag: [String] = []
        var secondDiag: [String] = []
        
        for row in 0..<board.count {
            if (board[row].allSatisfy {
                $0 == playerTwo.image
            }) {
                return 10
            } else if (board[row].allSatisfy {
                $0 == playerOne.image
            }) {
                return -10
            }
            
            let colArray = board.map { $0[row] }
            if (colArray.allSatisfy {
                $0 == playerTwo.image
            }) {
                return 10
            } else if (colArray.allSatisfy {
                $0 == playerOne.image
            }) {
                return -10
            }
            
            firstDiag.append(board[row][row])
            secondDiag.append(board[row][board.count - row - 1])
        }
        
        if (firstDiag.allSatisfy {
            $0 == playerTwo.image
        }) {
            return 10
        } else if (firstDiag.allSatisfy {
            $0 == playerOne.image
        }) {
            return -10
        }
        
        if (secondDiag.allSatisfy {
            $0 == playerTwo.image
        }) {
            return 10
        } else if (secondDiag.allSatisfy {
            $0 == playerOne.image
        }) {
            return -10
        }
        
        return 0
    }
    
    func minimax(board: [[String]], depth: Int, isMax: Bool) -> Int {
        let score = evaluateBoard(board: board)
        var board = board
        
        if (score == 10) {
            return 10 - depth
        }
        
        if (score == -10) {
            return -10 + depth
        }
        
        if (!isMoveLeft(board: board)) {
            return 0
        }
        
        if (isMax) {
            var best = -1000
            for i in 0..<board.count {
                for j in 0..<board[i].count {
                    if (board[i][j] == "") {
                        board[i][j] = playerTwo.image
                        best = max(best, minimax(board: board, depth: depth + 1, isMax: !isMax))
                        board[i][j] = ""
                    }
                }
            }
            return best
        } else {
            var best = 1000
            for i in 0..<board.count {
                for j in 0..<board[i].count {
                    if (board[i][j] == "") {
                        board[i][j] = playerOne.image
                        best = min(best, minimax(board: board, depth: depth + 1, isMax: !isMax))
                        board[i][j] = ""
                    }
                }
            }
            return best
        }
    }
    
    func makeMove(board: [[String]]) {
        var board = board
        
        var bestVal = -1000
        var bestMove: (Int, Int) = (0, 0)
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if (board[i][j] == "") {
                    board[i][j] = playerTwo.image
                    let moveVal = minimax(board: board, depth: 0, isMax: false)
                    board[i][j] = ""
                    
                    if (moveVal > bestVal) {
                        bestVal = moveVal
                        bestMove = (i, j)
                    }
                }
            }
        }
        
        print("The value of the best move is : \(bestMove)")
        print(bestVal)
        self.board[bestMove.0][bestMove.1] = playerTwo.image
        winner = checkWinner(board: self.board)
        if (winner == nil && isMoveLeft(board: board)) {
            self.player = playerOne
        }
        else if (winner != nil) {
            presentWinModal = true
        }
    }
    
    func checkWinner(board: [[String]]) -> TicTacToePlayer? {
        return switch evaluateBoard(board: board) {
        case 10: playerTwo
        case -10: playerOne
        default: nil
        }
    }
    
    func restartGame() {
        for rowIndices in board.indices {
            for colIndices in board[rowIndices].indices {
                board[rowIndices][colIndices] = ""
            }
        }
        player = playerOne
        winner = nil
    }
}

#Preview {
    TicTacToeView()
}
