//
//  MessageViewModel.swift
//  chatApp
//
//  Created by Djino Dissingar on 10/02/2023.
//

import Foundation
import SwiftUI
import Firebase

class MessageViewModel : ObservableObject {
    @Published var messages : [Message] = []
    var manager = FirebaseManager.shared
    
    
    init(id : String){
        AllMessage(idAutre : id)
    }
    
    
    func AllMessage(idAutre : String){
       
        manager.messageRef.addSnapshotListener { snapshot, error in
            let monUId = self.manager.myId()
            if let error = error {
                print(error.localizedDescription)
            }
            if let alls = snapshot?.documents {
                alls.forEach { documents in
                    let id = documents.documentID
                    let datas = documents.data()
                    let exp = datas["EXPEDITEUR"] as? String ?? ""
                    let dest = datas["DESTINATAIRE"] as? String ?? ""
                    if(monUId == exp && idAutre == dest || monUId == dest && idAutre == exp){
                        let newMessage = Message(id: id, dict: datas)
                        self.messages.append(newMessage)
                    }
                    
                }
            }
        }
        
        
        
    }
    
   
}
