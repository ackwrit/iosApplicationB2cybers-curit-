//
//  chatAppApp.swift
//  chatApp
//
//  Created by Djino Dissingar on 18/01/2023.
//

import SwiftUI

@main
struct chatAppApp: App {
   
    var body: some Scene {
        WindowGroup {
            ContentView(authVM: AuthViewModel())
        }
    }
}
