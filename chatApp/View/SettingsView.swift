//
//  SettingsView.swift
//  chatApp
//
//  Created by Djino Dissingar on 20/01/2023.
//

import SwiftUI


struct SettingsView: View {
    @State var bottomSheet = false
    @State var fullImagesheet = false
    @State var prenom = ""
    @State var nom = ""
    @State var pseudo = ""
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
                            
                            .sheet(isPresented: $fullImagesheet, onDismiss :{
                                print("dismiss")
                                
                            } ,content: {
                                PHPPickerRepresentable { img in
                                    FirebaseManager.shared.upDateImage(image: img)
                                   
                                }
                            })
                            .confirmationDialog("changer l'image", isPresented: $bottomSheet, actions: {
                                Button("Caméra") {
                                    self.fullImagesheet = true
                                }
                                Text("Caméra")
                                Button {
                                    self.fullImagesheet = true
                                } label: {
                                    Text("Librarie")
                                }
                            })
                            
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
                            Button {
                                if (prenom != "") {
                                    FirebaseManager.shared.UpadteUser(key: "PRENOM", datas: prenom)
                                    prenom = ""
                                }
                            } label: {
                                Image(systemName:"plus")
                            }

                            
                        }
                        
                        
                        
                        HStack {
                            TextField(userVm.users?.nom ?? "", text: $nom)
                            
                            Spacer()
                            Button {
                                if (nom != "") {
                                    FirebaseManager.shared.UpadteUser(key: "NOM", datas: nom)
                                    nom = ""
                                }
                            } label: {
                                Image(systemName:"plus")
                            }

                            
                        }
                        
                        HStack {
                            TextField(userVm.users?.pseudo ?? "", text: $pseudo)
                            
                            Spacer()
                            Button {
                                if (nom != "") {
                                    FirebaseManager.shared.UpadteUser(key: "PSEUDO", datas: pseudo)
                                    pseudo = ""
                                }
                            } label: {
                                Image(systemName:"plus")
                            }

                            
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
