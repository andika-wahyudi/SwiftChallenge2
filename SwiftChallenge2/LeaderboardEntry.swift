//
//  LeaderboardEntry.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 25/7/26.
//

import Foundation

struct LeaderboardEntry: Identifiable {
    let id = UUID()
    let name: String
    let score: Int
    let date: Date
}
