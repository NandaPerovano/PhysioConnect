//
//  LoginView.swift
//  PhysioConnect
//
//  Created by Fernanda Perovano on 15/07/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 12) {
            Image("Symbol")
                .resizable()
                .scaledToFit()
                .frame(height: 180)
                .padding(.top, 40)
            Text("FisioConnect")
                .font(.largeTitle.bold())
                .foregroundColor(Color.physioGreen)
            
            TextField("E-mail", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Senha", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(action: {
                viewModel.login()
            }) {
                Text("Entrar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.physioGreen)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Divider().padding(.vertical)

                       // 🔐 Botão do Google
//                       GoogleSignInButton(action: {
//                           googleVM.signIn()
//                       })
//                       .frame(height: 50)
//                   }
        }
        .padding()
        .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
            WelcomeView()
        }
    }
}

#Preview {
  LoginView()
}

