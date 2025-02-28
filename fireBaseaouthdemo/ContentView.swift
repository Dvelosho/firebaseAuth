//
//  ContentView.swift
//  FirebaseAuthDemoApp
//
//  Created by daniel veloso on 23-02-25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AppController.self) private var appController
    
    var body: some View {
        Group {
            switch appController.authState {
            case .undefined:
                ProgressView()
            case .notAuthenticated:
                AuthView()
            case .authenticated:
                ProfileView()
            }
        }
    }
}

#Preview {
    ContentView()
}
