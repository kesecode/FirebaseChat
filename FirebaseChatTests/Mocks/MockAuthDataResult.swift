//
//  MockAuthDataResult.swift
//  FirebaseChatTests
//
//  Created by David Weppler on 01.02.21.
//

import Foundation

import Firebase

class MockAuthDataResult: AuthDataResult {
    var user: User
    
    init() {
        user = User(uid: "TEST_00d49f18-3def-41e1-b3d4-9b342e43f76d", firstName: "Max", lastName: "Mustermann", email: "max.mustermann@mustermail.de")
    }
}
