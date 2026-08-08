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
    @AppStorage("highscore") private var highscore = 0
    
    func updateMessage() {
        message = "High Score: \(highscore)"
    }
    
    var body: some View {
        VStack {
            Button("Leaderboard") {
                showLeaderboard = true
            }
            .buttonStyle(.glassProminent)
            
            Text(message)
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
                }
                updateMessage()
            }
                .buttonStyle(.glassProminent)
        }
        .sheet(isPresented: $showLeaderboard) {
            ClickerLeaderboardView()
                .presentationDetents([.medium])
        }
        .padding()
    }
}

#Preview {
    ClickerView()
}
