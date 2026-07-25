//
//  PostsView.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 25/7/26.
//

import SwiftUI

struct PostsView: View {
    let colors: [Color] = [.red, .blue, .green, .orange, .purple]
    
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
                    // Flip Effect
                        .rotation3DEffect(
                            .degrees(flippedStates[index] ? 180 : 0),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.4)) {
                                flippedStates[index].toggle()
                            }
                        }
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            Text("Card \(currentIndex + 1) of \(colors.count)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    PostsView()
}
