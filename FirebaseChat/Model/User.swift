//
//  User.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import Foundation

struct User: Codable {
    var uid: String
    var firstName: String
    var lastName: String
    var email: String?

    init(uid: String, firstName: String, lastName: String, email: String) {
        self.uid = uid
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
