//
//  UserViewModel.swift
//  chatApp
//
//  Created by Djino Dissingar on 07/02/2023.
//

import Foundation
import Firebase


//la classe qui lit les modifications qui on lieu sur l'utilisateur

class UserViewModel : ObservableObject {
    //attributs
    @Published var users : Utilisateur?
    var manager  = FirebaseManager.shared
    
    
    
    //Constructeur
    init(id : String){
        getUser(id)
    }
    
    
    
    
    
    
    //méthode
   
    func getUser(_ id : String){
        manager.userRef.document(id).addSnapshotListener(resultat)
    }
    
    
    func resultat(snapshot : DocumentSnapshot?,error : Error?){
        guard let snap = snapshot else {return }
        //Toutes les instructions
        
        /*if(snapshot != nil){
            return
        }
        else
        {
            
        }*/
        let id = snap.documentID
        let datas = snap.data() ?? [:]
        let newUser = Utilisateur(id: id, dict: datas)
        self.users = newUser
        
        
    }
    
    
    
}
