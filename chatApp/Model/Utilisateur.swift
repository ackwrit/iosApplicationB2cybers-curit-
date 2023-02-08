//
//  Utilisateur.swift
//  chatApp
//
//  Created by Djino Dissingar on 18/01/2023.
//

import SwiftUI
// Le modèle utilisateur
struct Utilisateur : Identifiable {
    //attributs
    var id : String
    //nom
    var _nom : String?
    //prénom
    var _prenom : String?
    //avatar
    var _avatar : String?
    
    var _mail : String?
    
    var _pseudo : String?
    
    //Ce n'est pas un getter , variable calculé
    
    var pseudo : String {
        return _pseudo ?? ""
    }
    var nom : String {
        return _nom ?? ""
    }
    
    var prenom : String {
        return _prenom ?? ""
        
    }
    
    var mail : String {
        return _mail ?? ""
    }
    
    var avatar : String?{
        return _avatar
    }
    
    var nomComplet : String {
        return prenom + " " + nom
    }
    
    init(id : String , dict : [String:Any]) {
        self.id = id
        self._nom = dict["NOM"] as? String
        self._prenom = dict["PRENOM"] as? String
        self._avatar = dict["AVATAR"] as? String
        self._mail = dict["MAIL"] as? String
    }
    
    
    
    
}


