//
//  ContentView.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 11/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Clicker", systemImage: "pointer.arrow.ipad.rays") {
                ClickerView(scoreManager: ScoreManager())
            }
            Tab("Posts", systemImage: "square.and.arrow.up.on.square.fill") {
                PostsView(firestoreManager: FirestoreManager())
            }

        }
    }
}

#Preview {
    ContentView()
}
