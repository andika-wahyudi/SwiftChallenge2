//
//  ClickerLeaderboardView.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 25/7/26.
//

import SwiftUI

struct ClickerLeaderboardView: View {
    @Environment(\.dismiss) private var dismiss
    
    // Sample mock data
    @State private var entries: [LeaderboardEntry] = [
        LeaderboardEntry(name: "Serene", score: 42, date: Date()),
        LeaderboardEntry(name: "Jiachen", score: 28, date: Date()),
        LeaderboardEntry(name: "Andika", score: 15, date: Date())
    ]
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            Group {
                if entries.isEmpty {
                    Text("No Scores Yet")
                    Text("Be the first to get on the leaderboard!")
                } else {
                    List(Array(entries.enumerated()), id: \.element.id) { index, entry in
                        HStack {
                            // Rank Number
                            Text("#\(index + 1)")
                                .font(.headline)
                                .foregroundColor(index < 1 ? .yellow : .secondary)
                                .frame(width: 35, alignment: .leading)
                            
                            // Name & Date
                            VStack(alignment: .leading) {
                                Text(entry.name)
                                    .font(.body)
                                    .fontWeight(.bold)
                                Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            
                            // Score
                            Text("\(entry.score)")
                                .font(.title3)
                                .fontWeight(.heavy)
                        }
                    }
                }
            }
            .navigationTitle("Leaderboard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    ClickerLeaderboardView()
}
