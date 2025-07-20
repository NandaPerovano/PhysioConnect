//
//  LoginViewModel.swift
//  PhysioConnect
//
//  Created by Fernanda Perovano on 15/07/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?

    func login() {
        // Simulação de validação simples
        if email.isEmpty || password.isEmpty {
            errorMessage = "Preencha todos os campos"
            return
        }

        if email == "user@example.com" && password == "123456" {
            isLoggedIn = true
            errorMessage = nil
        } else {
            errorMessage = "Credenciais inválidas"
        }
    }
}
