//
//  LoginViewModel.swift
//  PhysioConnect
//
//  Created by Fernanda Perovano on 15/07/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var userType: UserType = .paciente // setado após o login real
    @Published var errorMessage: String?

    func login() {
        // Simulação de login
        if email == "paciente@email.com" {
            userType = .paciente
        } else {
            userType = .profissional
        }
        isLoggedIn = true
    }
}
