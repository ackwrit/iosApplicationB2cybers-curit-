//
//  SettingsView.swift
//  chatApp
//
//  Created by Djino Dissingar on 20/01/2023.
//

import SwiftUI


struct SettingsView: View {
    @StateObject var userVm : UserViewModel
    var body: some View {
        NavigationView {
            VStack{
                Image("samourai")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:400,height: 200)
                HStack {
                    Spacer()
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Text(userVm.users?.nomComplet ?? "")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    
                        .foregroundColor(Color.purple)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        
                    
                    Spacer()
                }
                .padding()
            
                List {
                    Section("Infomations"){
                        SectionRowView(image: "person.crop.circle", text: "contact")
                    }
                    
                    Section("Réglages de l'app"){
                        SectionRowView(image: "gear", text: "Réglages")
                        SectionRowView(image: "signature", text: "Mentions légales")
                        
                    }
                    
                    Section("A propos de nous") {
                        SectionRowView(image: "message", text: "Nous contacter")
                        SectionRowView(image: "book.circle", text: "Historique")
                    }
                    
                  
                    
                    
                }
                .listStyle(.sidebar)
                
                

                Spacer()
                
                
                
            }
            .edgesIgnoringSafeArea(.all)
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userVm: UserViewModel(id: FirebaseManager.shared.myId()))
    }
}
