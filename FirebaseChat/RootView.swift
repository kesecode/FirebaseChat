//
//  RootView.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import SwiftUI


struct RootView: View {
    @EnvironmentObject var session: SessionManager

    @AppStorage("login_state") var loginState = false

    var body: some View {
        NavigationView {
            VStack{
              if loginState == true {
                HomeView()
              } else {
                LoginView()
              }
            }.onAppear(perform: session.initialize)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
