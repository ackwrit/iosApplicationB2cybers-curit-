//
//  FirebaseManager.swift
//  chatApp
//
//  Created by Djino Dissingar on 18/01/2023.
//

import Foundation
import Firebase


// La classe qui permet la connexion à la base de donnée

class FirebaseManager {
    static let shared = FirebaseManager()
    
    var auth : Auth
    var cloudFirestore : Firestore
    
    init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        auth = Auth.auth()
        cloudFirestore = Firestore.firestore()
    }
    
    var userRef : CollectionReference {
        return cloudFirestore.collection("UTILISATEURS")
    }
    
    
    func addUser(uid : String , map :[String:Any]){
        userRef.document(uid).setData(map)
    }
    
    func myId() -> String {
        return auth.currentUser?.uid ?? ""
        
    }
    
    func logOut(){
        do {
            try auth.signOut()
        }catch{
            print(error.localizedDescription)
        }
    }
    

}
