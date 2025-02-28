//
//  ProfileView.swift
//  fireBaseaouthdemo
//
//  Created by daniel veloso on 24-02-25.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(AppController.self) private var appController
    
    var body: some View {
        VStack {
            
            Text("Hello, ProfileView!")
            
            Button("Logout") {
                do {
                    try appController.signOut()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
