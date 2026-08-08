//
//  PostsView.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 25/7/26.
//

import SwiftUI

struct PostsView: View {
    let colors: [Color] = [.red, .blue, .green, .orange, .pink]
    
    @State private var currentIndex: Int = 0
    @State private var flippedStates: [Bool] = [false, false, false, false, false]
    
    var body: some View {
        VStack(spacing: 20) {
            TabView(selection: $currentIndex) {
                ForEach(0..<colors.count, id: \.self) { index in
                    Rectangle()
                        .fill(flippedStates[index] ? colors[index].opacity(0.4) : colors[index])
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                        .frame(height: 380)
                        .padding(.horizontal, 40)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            Text("Post \(currentIndex + 1) of \(colors.count)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    PostsView()
}
