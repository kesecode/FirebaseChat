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
    @Published var email: String = ""

    @Published var password: String = ""

    @Published var error: String = ""

    @Published var firstName: String = ""

    @Published var lastName: String = ""

    @Published var passwordConfirmation: String = ""
}


extension SignUpViewModel {
    func signUp() {
      createUser() { [self] result in
          guard let result = result else { return }
          DispatchQueue.global(qos: .background).async {
              Persistence.firestore.insertUser(firstName: self.firstName, lastName: self.lastName, email: self.email, result: result)
          }
        }
    }

  func createUser(completion: @escaping (_ result: AuthDataResult?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
                completion(result)
            }
        }
    }
}
