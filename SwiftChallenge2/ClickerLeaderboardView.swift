//
//  ClickerLeaderboardView.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 25/7/26.
//

import SwiftUI

struct ClickerLeaderboardView: View {
    @Environment(\.dismiss) private var dismiss
    
    // Sample mock data for testing the UI layout
    @State private var entries: [LeaderboardEntry] = [
        LeaderboardEntry(name: "SwiftCoder", score: 42, date: Date()),
        LeaderboardEntry(name: "Andika", score: 28, date: Date().addingTimeInterval(-86400)),
        LeaderboardEntry(name: "Jiachen", score: 15, date: Date().addingTimeInterval(-172800))
    ]
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading High Scores...")
                } else if entries.isEmpty {
                    ContentUnavailableView(
                        "No Scores Yet",
                        systemImage: "trophy",
                        description: Text("Be the first to get on the leaderboard!")
                    )
                } else {
                    List(Array(entries.enumerated()), id: \.element.id) { index, entry in
                        HStack {
                            // Rank Number
                            Text("#\(index + 1)")
                                .font(.headline)
                                .foregroundColor(index < 3 ? .yellow : .secondary)
                                .frame(width: 35, alignment: .leading)
                            
                            // Name & Date
                            VStack(alignment: .leading) {
                                Text(entry.name)
                                    .font(.body)
                                    .fontWeight(.bold)
                                Text(entry.date.formatted(date: .abbreviated, time: .shortened))
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
            .navigationTitle("Leaderboard 🏆")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            // --- FIREBASE FETCHING COMMENTED OUT ---
            // .task {
            //     await fetchLeaderboard()
            // }
        }
    }

    // private func fetchLeaderboard() async {
    //     let db = Firestore.firestore()
    //     do {
    //         let snapshot = try await db.collection("leaderboard")
    //             .order(by: "score", descending: true)
    //             .limit(to: 10)
    //             .getDocuments()
    //
    //         self.entries = snapshot.documents.compactMap { doc in
    //             try? doc.data(as: LeaderboardEntry.self)
    //         }
    //     } catch {
    //         print("Error fetching leaderboard: \(error.localizedDescription)")
    //     }
    //     isLoading = false
    // }
}

#Preview {
    ClickerLeaderboardView()
}
