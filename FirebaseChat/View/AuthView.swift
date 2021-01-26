//
//  AuthView.swift
//  FirebaseChat
//
//  Created by David Weppler on 26.01.21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                Text("Welcome back \(session.session!.email ?? "user")")
                Button(action: session.signOut) {
                    Text("Sign Out")
                }
            } else {
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
