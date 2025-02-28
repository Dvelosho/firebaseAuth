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
    
    func getUserProfile() {
        let user = Auth.auth().currentUser
        
        if let user {
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL
        }
    }
    
    func updateUserProfile() {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = "Ada"
        changeRequest?.commitChanges(completion: { err in
            if let err {
                print(err.localizedDescription)
            }
            
        })
    }
    
    func setUserEmail() {
        Auth.auth().currentUser?.updateEmail(to: <#T##String#>, completion: { err in
            if let err {
                print(err.localizedDescription)
            }
        })
    }
    
    func reAuthenticate() {
        let user = Auth.auth().currentUser
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        user?.reauthenticate(with: credential, completion: { result, err in
            if let err {
                print(err)
            }
            print(result)
        })
    }
    
    func sendUserEmailVerification() {
        Auth.auth().currentUser?.sendEmailVerification(completion: { err in
            if let err {
                print(err.localizedDescription)
            }
        })
    }
    
    func setUserPassword() {
        Auth.auth().currentUser?.updatePassword(to: <#T##String#>, completion: { err in
            if let err {
                print(err.localizedDescription)
            }
        })
    }
    
    func deleteUser() {
        
        let user = Auth.auth().currentUser
        
        user?.delete(completion: { err in
            if let err {
                print(err.localizedDescription)
            }
        })
    }
}
