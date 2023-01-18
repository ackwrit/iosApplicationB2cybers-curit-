//
//  ContentView.swift
//  chatApp
//
//  Created by Djino Dissingar on 18/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State var mail : String = ""
    @State var password : String = ""
    var body: some View {
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
         
            
            
            TextField("Entrer votre adresse",text:$mail)
                .font(.largeTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Entrer votre mot de passe ",text:$password)
                .font(.largeTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            Button {
                //Se connecter
            } label: {
                Text("Connexion")
                    .padding()
                    .foregroundColor(Color.white)
                    .background {
                        Color.purple
                    }
                   
                   
                    .clipShape(Capsule())
            }
            Button {
                //Se connecter
            } label: {
                Text("Inscription")
                    .padding()
                    .foregroundColor(Color.white)
                    .background {
                        Color.purple
                    }
                   
                   
                    .clipShape(Capsule())
            }

           
            Spacer()
           
        }
        
        
        
        .padding()
        .background {
           Image("soul_eater")
                .resizable()
               .aspectRatio(contentMode: .fill)
        }
        .edgesIgnoringSafeArea(.all)
       
        
       
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
