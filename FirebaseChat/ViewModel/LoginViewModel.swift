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
}


extension LoginViewModel {
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
}
