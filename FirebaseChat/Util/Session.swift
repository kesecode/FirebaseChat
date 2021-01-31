//
//  Session.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import Foundation

import Firebase

import SwiftUI

import Combine


final class Session: ObservableObject {
    static var session = PassthroughSubject<Session, Never>()

    @AppStorage("login_state") var loginState = false

    @Published var user: User? {  didSet  {
          Session.session.send(self)
        }
    }

    var handle: AuthStateDidChangeListenerHandle?

    func initialize() {
        if let user = Auth.auth().currentUser {
          user.reload()
        }
        listen()
    }

    func listen() {
        loginState = false;
          handle = Auth.auth().addStateDidChangeListener({(auth, user) in
              if let user = user {
                Persistence.firestore.getUser(uid: user.uid, completion: { (user, error) in
                  if let error = error {
                    print(error)
                  } else {
                    guard let user = user else { return }
                    self.user = user
                  }
                })
                  self.loginState = true
              } else {
                  self.user = nil
                  self.loginState = false
              }
          })
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
