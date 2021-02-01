//
//  LoginViewModel.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import SwiftUI

import Firebase

import Combine


final class LoginViewModel: ObservableObject {
    @Published var email: String = ""

    @Published var password: String = ""

    @Published var loginError: Error?
    
    @Published var loginSuccess = false
    
    private let sessionManager: SessionManaging
    
    init(sessionManager: SessionManaging = SessionManager()) {
        self.sessionManager = sessionManager
    }
}


extension LoginViewModel {
    func login() {
        sessionManager.login(email: self.email, password: self.password) { res in
            switch res {
            case let .failure(err):
                self.loginError = err
            case .success:
                self.loginSuccess = true
            }
        }
    }
}
