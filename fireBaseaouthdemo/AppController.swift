//
//  AppController.swift
//  fireBaseaouthdemo
//
//  Created by daniel veloso on 24-02-25.
//

import SwiftUI
import FirebaseAuth

enum AuthState {
    case undefined, authenticated, notAuthenticated
}

@Observable
class AppController{
    
    var email = ""
    var password = ""
    
    var authState: AuthState = .undefined
    
    func listenToAuthChanges() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.authState = user != nil ? .authenticated : .notAuthenticated
        }
    }
    
    func singUp() async throws {
        _ = try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func signIn() async throws {
        _ = try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
