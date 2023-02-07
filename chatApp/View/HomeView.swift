//
//  HomeView.swift
//  chatApp
//
//  Created by Djino Dissingar on 20/01/2023.
//

import SwiftUI

struct HomeView: View {
    @State var valeur : Int = 0
    @StateObject var userVm = UserViewModel(id: FirebaseManager.shared.myId())
    var body: some View {
        VStack {
            TabView(selection: $valeur) {
                Text("coucou")
                    .tabItem {
                        Text("Personnes")
                        Image(systemName: "person.fill")
                    }
                
                Text("SALUT")
                    .tabItem {
                        Text("Favoris")
                        Image(systemName: "heart")
                    }
                SettingsView(userVm: userVm)
                    .tabItem {
                        Text("Réglage")
                        Image(systemName: "gear")
                    }
                
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
