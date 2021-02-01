//
//  SessionManager.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import Foundation

import Firebase

import SwiftUI

import Combine


final class SessionManager: ObservableObject, SessionManaging {
    static var session = PassthroughSubject<SessionManager, Never>()

    @AppStorage("login_state") var loginState = false

    @Published var user: User? {  didSet  {
          SessionManager.session.send(self)
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
                    PersistenceManager.firestore.getUser(uid: user.uid, completion: { res in
                        switch res {
                        case let .failure(err):
                            print(err)
                        case let .success(user):
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
    
    func login(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if let err = err {
                completion(.failure(err))
            } else {
                guard let res = res else { return }
                completion(.success(res))
            }
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


protocol SessionManaging {
    func login(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void)
}
