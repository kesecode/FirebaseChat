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
        createUser() { result in
            switch result {
            case let .success(res):
                DispatchQueue.global(qos: .background).async {
                    PersistenceService.firestore.insertUser(firstName: self.firstName, lastName: self.lastName, email: self.email, result: res)
                }
            case let .failure(err):
                self.error = err.localizedDescription
          }
        }
    }

  func createUser(completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            if let err = err {
                completion(.failure(err))
            } else {
                guard let res = res else { return }
                completion(.success(res))
            }
        }
    }
}
