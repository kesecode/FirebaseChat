//
//  FirebaseChatApp.swift
//  FirebaseChat
//
//  Created by David Weppler on 26.01.21.
//

import SwiftUI
import Firebase

@main
struct firebaseDemoAppApp: App {
    init() {
        FirebaseApp.configure()
      }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Session())
        }
    }
}

