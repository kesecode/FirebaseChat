//
//  LoginView.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

import SwiftUI


struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
      VStack {
          Text("Welcome Back!")
              .font(.system(size: 32, weight: .heavy))

          Text("Sign in to continue")
              .font(.system(size: 18, weight: .medium))
              .foregroundColor(Color("Gray"))

          VStack(spacing: 18) {
            TextField("Email address", text: $viewModel.email)
                  .font(.system(size: 14))
                  .padding(12)
                  .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("bg1"), lineWidth: 1))

            SecureField("Password", text: $viewModel.password)
                  .font(.system(size: 14))
                  .padding(12)
                  .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("bg1"), lineWidth: 1))
          }
          .padding(.vertical, 64)

        Button(action: viewModel.login) {
              Text("Sign in")
                  .frame(minWidth: 0, maxWidth: .infinity)
                  .frame(height: 50)
                  .foregroundColor(.white)
                  .font(.system(size: 14, weight: .bold))
                  .background(LinearGradient(gradient: Gradient(colors: [Color("bg1"), Color("bg2")]), startPoint: .leading, endPoint: .trailing))
              .cornerRadius(5)
          }

        if (viewModel.loginError != nil) {
            Text(viewModel.loginError!.localizedDescription)
                  .font(.system(size: 14, weight: .semibold))
                  .foregroundColor(.red)
                  .padding()
          }

          Spacer()

        NavigationLink(destination: SignUpView()) {
              HStack {
                  Text("I'm a new user.")
                      .font(.system(size: 14, weight: .light))
                      .foregroundColor(.primary)

                  Text("Create an account")
                      .font(.system(size: 14, weight: .semibold))
                      .foregroundColor(Color("bg2"))
              }
          }
      }
      .padding(.horizontal, 32)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
