//
//  PersistenceManager.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import Foundation

import Firebase


final class PersistenceManager: ObservableObject {
    static let firestore = PersistenceManager();

    let connection = Firestore.firestore()
}

// MARK: Account Management

extension PersistenceManager {

    /// Inserts new user to database
  func insertUser(firstName: String, lastName: String, email: String, result: AuthDataResult) {
      connection.collection("User").document(result.user.uid).setData([
          "first_name": firstName,
          "last_name": lastName,
          "email_address": email
      ])
  }

  func getUser(uid: String, completion: @escaping (Result<User, Error>) -> Void) {
        connection.collection("User").document(uid).getDocument { (documentSnapshot, err) in
            if let err = err {
                completion(.failure(err))
            } else {
                guard let documentSnapshot = documentSnapshot else { return }
                let data = documentSnapshot.data()

                let email = data!["email_address"] as? String ?? ""
                let firstName = data!["first_name"] as? String ?? ""
                let lastName = data!["last_name"] as? String ?? ""

                completion(.success(User(uid: uid, firstName: firstName, lastName: lastName, email: email)))
            }
        }
    }
}
