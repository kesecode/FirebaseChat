//
//  HomeViewModel.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import SwiftUI

import Firebase

import Combine


final class HomeViewModel: ObservableObject {
    @AppStorage("login_state") var loginState = false

    var cancellable: AnyCancellable?

    @Published var user: User?

    init() {
      cancellable = SessionService.session.sink(receiveValue: { (session) in
          self.user = session.user
      })
    }
}


extension HomeViewModel {
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out")
        }
    }
}


/*
 sink(receiveValue: { (Session) in
   guard let user = Session.user else { return }
   self.user = user
 })
 */
