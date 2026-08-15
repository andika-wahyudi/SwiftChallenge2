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
    @AppStorage("playerName") private var playerName = ""
    @State private var showNamePrompt = false
    @State private var highscore = 0
    @ObservedObject var scoreManager: ScoreManager
    
    
    var body: some View {
        VStack {
            Button("Leaderboard") {
                showLeaderboard = true
            }
            .buttonStyle(.glassProminent)
            
            Text("Highscore: \(scoreManager.scores.first?.yourScore ?? 0)")
            Spacer()
            
            Image(.jiachen)
                .resizable()
                .frame(width: CGFloat(100+2*counter), height: CGFloat(100+2*counter))
                .padding()
            
            Spacer()
            
            Text("Swift progress: \(counter)")
            
            Button("I love Swift") {
                counter += 1
                if scoreManager.scores.first?.yourScore ?? 0 < counter {
                    highscore = counter
                    scoreManager.addNote(playerName: playerName, yourScore: highscore)
                }
            }
                .buttonStyle(.glassProminent)
            NavigationLink("Switch to player", destination: ClickerView(scoreManager: ScoreManager()))
        }
        .sheet(isPresented: $showLeaderboard) {
            ClickerLeaderboardView(scoreManager: ScoreManager())
        }
        .padding()
        .onAppear {
            scoreManager.getNotes()
            if playerName.isEmpty {
                showNamePrompt = true
            }
        }
        .alert("Enter your name", isPresented: $showNamePrompt) {
            TextField("Your name", text: $playerName) // saves to @AppStorage as they type
            Button("Done") { showNamePrompt = false }
        }
    }
}

#Preview {
    ClickerView(scoreManager: ScoreManager())
}
