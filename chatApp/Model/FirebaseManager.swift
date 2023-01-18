//
//  FirebaseManager.swift
//  chatApp
//
//  Created by Djino Dissingar on 18/01/2023.
//

import Foundation
import Firebase


class FirebaseManager {
    static let shared = FirebaseManager()
    
    var auth : Auth
    
    init() {
        FirebaseApp.configure()
        auth = Auth.auth()
    }
    
    //Méthodes
    
    
    //Création d'un utilisateur
    
    
    //Connexion d'un utilisateur
    
    
    //Déconnexion d'un utilisateur
}
