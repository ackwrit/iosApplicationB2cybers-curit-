//
//  SettingsView.swift
//  chatApp
//
//  Created by Djino Dissingar on 20/01/2023.
//

import SwiftUI


struct SettingsView: View {
    @State var bottomSheet = false
    @State var prenom = ""
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
                    Button {
                        self.bottomSheet = true
                    } label: {
                        Image(systemName: "person.fill")
                            
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .sheet(isPresented: $bottomSheet) {
                                Text("Caméra")
                                Text("Librarie")
                            }
                    }

                    
                        
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
                        HStack {
                            TextField(userVm.users?.prenom ?? "", text: $prenom)
                            
                            Spacer()
                            Image(systemName:"plus")
                        }
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
