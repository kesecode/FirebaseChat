//
//  FirebaseChatApp.swift
//  FirebaseChat
//
//  Created by David Weppler on 26.01.21.
//

import SwiftUI

import Firebase

@main
struct FirebaseChatApp: App {
    @AppStorage("login_state") var loginState = false

    init() {
          FirebaseApp.configure()
      }
    
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(SessionManager())
        }
    }
}
