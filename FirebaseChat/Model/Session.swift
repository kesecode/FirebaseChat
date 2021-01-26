//
//  Session.swift
//  FirebaseChat
//
//  Created by David Weppler on 26.01.21.
//

import SwiftUI

import Firebase

import Combine

class Session: ObservableObject {
    
    var didChange = PassthroughSubject<Session, Never>()
    
    @Published var session: User? {didSet {didChange.send(self)}}
    
    var handle: AuthStateDidChangeListenerHandle?
    
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({(auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, email: user.email ?? "mail@example.com")
            } else {
                self.session = nil
            }
        })
    }
    
    func signUp(firstName: String, lastName: String, email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        Persistence.firestore.insertUser(firstName: firstName, lastName: lastName, email: email)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch {
            print("Error signing out")
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}

struct User {
    var uid: String
    var email: String?
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
