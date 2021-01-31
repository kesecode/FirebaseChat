//
//  Persistence.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
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
  func insertUser(firstName: String, lastName: String, email: String, result: AuthDataResult) {
      connection.collection("User").document(result.user.uid).setData([
          "first_name": firstName,
          "last_name": lastName,
          "email_address": email
      ])
  }

  func getUser(uid: String, completion: @escaping (_ user: User?, _ error: Error?) -> Void) {
        connection.collection("User").document(uid).getDocument { (documentSnapshot, err) in
            if let err = err {
                  completion(nil, err)
            } else {
                if let documentSnapshot = documentSnapshot {
                    let data = documentSnapshot.data()

                    let email = data!["email_address"] as? String ?? ""
                    let firstName = data!["first_name"] as? String ?? ""
                    let lastName = data!["last_name"] as? String ?? ""

                    completion(User(uid: uid, firstName: firstName, lastName: lastName, email: email), nil)
                } else {
                  completion(nil, err)
                }
            }
        }
    }
}
