//
//  SignInViewModel.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import SwiftUI

import Firebase

import Combine


final class SignUpViewModel: ObservableObject {
  @AppStorage("login_state") var loginState = false

  @State var email: String = ""

  @State var password: String = ""

  @State var error: String = ""

  @State var firstName: String = ""

  @State var lastName: String = ""



}


extension SignUpViewModel {

    func signUp(handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        Persistence.firestore.insertUser(firstName: firstName, lastName: lastName, email: email)
    }
}
