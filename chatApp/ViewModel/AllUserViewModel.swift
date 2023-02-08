//
//  AllUserViewModel.swift
//  chatApp
//
//  Created by Djino Dissingar on 08/02/2023.
//

import Foundation
import SwiftUI
import Firebase

class AllUserViewModel : ObservableObject {
    @Published var allUser : [Utilisateur] = []
    var manager = FirebaseManager.shared
    
    init() {
        
        fetchAll()
    }
    
    func fetchAll(){
        self.allUser = []
        manager.userRef.addSnapshotListener(resultat)
       
    }
    
    
    func resultat(snapshot: QuerySnapshot?, error: Error?){
        if let error = error {
            print(error.localizedDescription)
        }
        if let all = snapshot?.documents {
            let uid = manager.myId()
            all.forEach { snap in
                let id = snap.documentID
                let datas = snap.data()
                let newUser = Utilisateur(id: id, dict: datas)
                if uid != id {
                    self.allUser.append(newUser)
                }
                
            }
        }
    }
    
}
