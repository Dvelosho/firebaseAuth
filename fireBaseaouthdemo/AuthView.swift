//
//  AuthView.swift
//  fireBaseaouthdemo
//
//  Created by daniel veloso on 24-02-25.
//

import SwiftUI

struct AuthView: View {
    
    @Environment(AppController.self) private var appController
    
    @State private var isSingUp = false
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Email", text: Bindable(appController).email)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: Bindable(appController).password)
                .textFieldStyle(.roundedBorder)
            
            Button {
                authenticate()
            } label: {
                HStack {
                    Spacer()
                    Text("\(isSingUp ? "Sing up" : "Sing in")")
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button("\(isSingUp ? "I already have an account" : "I don't have an account")") {
                isSingUp.toggle()
            }
            .padding()
        }
        .padding()
    }
    
    func authenticate() {
        isSingUp ? singUp() : singIn()
    }
    
    func singUp() {
        Task {
            do {
                try await appController.singUp()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func singIn() {
        Task {
            do {
                try await appController.singUp()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    AuthView()
}
