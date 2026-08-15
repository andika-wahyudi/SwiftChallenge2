//
//  ClickerView.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 25/7/26.
//


import SwiftUI

struct ClickerView: View {
    
    // everytime you want to put something on screen that changes
    // you need a state variable.
    @State private var counter = 0
    @State private var message = ""
    @State private var showLeaderboard = false
    @State private var playerName = "Player"
    @State private var highscore = 0
    @ObservedObject var scoreManager: ScoreManager
    
    
    var body: some View {
        VStack {
            Button("Leaderboard") {
                showLeaderboard = true
            }
            .buttonStyle(.glassProminent)
            
            Text("Highscore: \(highscore)")
            Spacer()
            
            Image(.jiachen)
                .resizable()
                .frame(width: CGFloat(100+2*counter), height: CGFloat(100+2*counter))
                .padding()
            
            Spacer()
            
            Text("Swift progress: \(counter)")
            
            Button("I love Swift") {
                counter += 1
                if highscore < counter {
                    highscore = counter
                    scoreManager.addNote(playerName: playerName, yourScore: highscore)
                }
            }
                .buttonStyle(.glassProminent)
        }
        .sheet(isPresented: $showLeaderboard) {
            ClickerLeaderboardView(scoreManager: ScoreManager())
        }
        .padding()
        .onAppear {
            scoreManager.getNotes()
        }
    }
}

#Preview {
    ClickerView(scoreManager: ScoreManager())
}
