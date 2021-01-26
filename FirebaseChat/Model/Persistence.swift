//
//  Persistence.swift
//  FirebaseChat
//
//  Created by David Weppler on 26.01.21.
//

import Foundation

import Firebase

final class Persistence: ObservableObject {
    static let firestore = Persistence();
    
    let connection = Firestore.firestore()
}

// MARK: Account Management

extension Persistence {
    
    /// Inserts new user to database
    func insertUser(firstName: String, lastName: String, email: String) {
        connection.collection("User").addDocument(data: [
            "first_name": firstName,
            "last_name": lastName,
            "email_address": email
        ])
    }
}
