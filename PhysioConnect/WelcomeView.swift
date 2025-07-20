//
//  Home.swift
//  PhysioConnect
//
//  Created by Fernanda Perovano on 15/07/25.
//

import SwiftUI

import SwiftUI

enum UserType: String, CaseIterable, Identifiable {
    case paciente = "Paciente"
    case profissional = "Profissional"

    var id: String { self.rawValue }
}

struct WelcomeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var userType: UserType = .paciente

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image("Symbol")
                .resizable()
                .scaledToFit()
                .frame(height: 180)

            Text("Bem-vindo ao FisioConnect")
                .font(.title2.bold())

            Text("Agende e gerencie suas sessões domiciliares")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal)

            Picker("Selecione seu perfil", selection: $userType) {
                ForEach(UserType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            Spacer()

            Button(action: {
                // Aqui você pode navegar para a próxima tela específica do tipo de usuário
                print("Entrou como \(userType.rawValue)")
            }) {
                Text("Começar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.physioGreen)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Button("Sair") {
                dismiss()
            }
            .foregroundColor(.gray)

            Spacer().frame(height: 20)
        }
    }
}


#Preview {
    WelcomeView()
}
