//
//  MessageView.swift
//  chatApp
//
//  Created by Djino Dissingar on 10/02/2023.
//

import SwiftUI


struct MessageView: View {
    @State var messageEcrit = ""
    var date = Date()
    var isCheck = false
    @StateObject var authVM = AuthViewModel()
    var destinataire : String
    @StateObject var allMessages : MessageViewModel
    
    
    
    var body: some View {
        VStack {
           
            List {
                ForEach(allMessages.messages) { value in
                    Text(value.texte)
                }
            }
            Spacer()
            HStack {
                TextField("Envoyer votre message", text: $messageEcrit)
                Button {
                    let dict : [String:Any]=["DESTINATAIRE": destinataire,"DATE":date,"isVue" :isCheck,"EXPEDITEUR":FirebaseManager().myId(),"TEXTE":messageEcrit]
                    
                    authVM.manager.addMessage(uid: FirebaseManager().myId(), map: dict)
                    print(allMessages.messages)
                    
                    messageEcrit = ""
                    
                    
                    
                    
                } label: {
                    Image(systemName: "paperplane")
                }

            }
            
        }
    }
        
}


