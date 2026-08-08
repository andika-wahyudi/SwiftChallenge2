//
//  TRIALFile.swift
//  SwiftChallenge2
//
//  Created by Lim Shi Hui Serene     on 1/8/26.
//

import SwiftUI
import FirebaseFirestore
import Combine

class ScoreManager: ObservableObject {
    private var db = Firestore.firestore()
    @Published var scores = [HighScore]()
    
    // Create Note
    func addNote(yourScore: Int) {
        let newScore = HighScore(yourScore: yourScore)
        
        do {
            _ = try db.collection("Scores").addDocument(from: newScore) //adds the newNote doc in notes collection
        } catch {
            print("Error adding document: \(error)") // in case got error this is a failsafe
        }
    }
    
    // Read Notes
    func getNotes() {
        db.collection("Scores").order(by: "yourScore").addSnapshotListener { snapshot, error in
            //sorts in alphabetical (.order(by: "model var name")) addSnapshotListener triggers when it detects an update
            if let error = error {
                print("Error getting notes: \(error)")
                return
            }
            
            self.scores = snapshot?.documents.compactMap { document in // loops through the list of data
                try? document.data(as: HighScore.self) // converts the raw text to the Swift note object
            } ?? [] //failsafe, incase got no data default note to blank
        }
    }
    
    // Update Note
    func updateNote(highScore: HighScore) {
        guard let noteID = highScore.id else { return }
        
        do {
            try db.collection("Scores").document(noteID).setData(from: highScore )
        } catch {
            print("Error updating note: \(error)")
        }
    }
    
    // Delete Note
    func deleteNote(highScore: HighScore) {
        guard let noteID = highScore.id else { return }
        
        db.collection("Scores").document(noteID).delete { error in
            if let error = error {
                print("Error deleting note: \(error)")
            }
        }
    }
}

