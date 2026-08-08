//
//  SwiftChallenge2App.swift
//  SwiftChallenge2
//
//  Created by Andika Wahyudi on 11/7/26.
//

import SwiftUI
import FirebaseCore


@main
struct SwiftChallenge2App: App {
    init(){
        FirebaseApp.configure()
        print("configured Firebase")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


