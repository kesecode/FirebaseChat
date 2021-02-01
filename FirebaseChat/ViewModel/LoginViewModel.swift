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

    @Published var error: String = ""
    
    let sessionService = SessionService()
}


extension LoginViewModel {
    func login() {
        sessionService.login(email: self.email, password: self.password) { res in
            switch res {
            case let .failure(err):
                self.error = err.localizedDescription
            case let .success(res):
                print("Successfully logged in user with ID: ", res.user.uid)
            }
        }
    }
}
