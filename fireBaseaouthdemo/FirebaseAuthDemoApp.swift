//
//  FirebaseAuthDemoApp.swift
//  FirebaseAuthDemo
//
//  Created by daniel veloso on 23-02-25.
//

import SwiftUI

@main
struct FirebaseAuthDemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var appController = AppController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appController)
                .onAppear {
                    appController.listenToAuthChanges()
                }
        }
    }
}
