//
//  ContentView.swift
//  chatApp
//
//  Created by Djino Dissingar on 18/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authVM : AuthViewModel
    @State var mail : String = ""
    @State var password : String = ""
    @State var prenom : String = ""
    @State var nom : String = ""
    @State var tag = 0
    var body: some View {
        
            if(authVM.isFinishConnecting){
                
                VStack {
                 
                    //Logo
                  Image("fate")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    //titre
                    Text("Mon application")
                        .font(.largeTitle)
                        .foregroundColor(Color.red)
                        .bold()
                    
                    Picker("choix",selection: $tag) {
                        Text("Inscription").tag(0)
                        Text("Connexion")
                            .tag(1)
                    }
                    .pickerStyle(.segmented)
                 
                    
                    
                    TextField("adresse mail",text:$mail)
                        .font(.largeTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("mot de passe",text:$password)
                        .font(.largeTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    VStack {
                        if (tag == 0){
                            TextField("Entrer votre nom",text:$nom)
                                .font(.largeTitle)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            
                            TextField("Entrer votre prénom",text:$prenom)
                                .font(.largeTitle)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                   
                    }
                    Spacer()
                    Button {
                        if (tag == 0){
                            authVM.CreateUser(mail: mail, password: password, prenom: prenom, nom: nom)
                        }
                    } label: {
                        Text(tag == 0 ? "Inscription" : "Connexion")
                            .padding()
                            .foregroundColor(Color.white)
                            .background {
                                Color.purple
                            }
                           
                           
                            .clipShape(Capsule())
                    }
                    
                      
                    

                  

                   
                    Spacer()
                   
                }
                .alert(authVM.erroString, isPresented: $authVM.showError, actions: {
                    Text("Ok")
                })
                .animation(.easeInOut, value: tag)
                
                
                
                
                .padding()
                .background {
                   Image("soul_eater")
                        .resizable()
                       .aspectRatio(contentMode: .fill)
                }
                .edgesIgnoringSafeArea(.all)
                
            }
            else
            {
                VStack {
                    Text("En cours de connection ... ")
                }
                
            }
        }
      

       
        
       
        
        
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authVM: AuthViewModel())
    }
}
