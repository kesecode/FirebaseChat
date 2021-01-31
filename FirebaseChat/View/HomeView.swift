//
//  HomeView.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import SwiftUI


struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()


    var body: some View {
      VStack {
          Text("Home").bold()
          Spacer()
          Text("Hello,")
          HStack(alignment: .center, spacing: 3.0) {
              Text(viewModel.user?.firstName ?? "").bold()
              Text(viewModel.user?.lastName ?? "").bold()
          }.padding(1)
          Spacer()
          Button(action: viewModel.signOut) {
                Text("Sign out")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                  .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color("bg2")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5)
            }
        }
      .padding(.horizontal, 32)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
