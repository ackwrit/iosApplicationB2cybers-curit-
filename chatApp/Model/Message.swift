//
//  Message.swift
//  chatApp
//
//  Created by Djino Dissingar on 10/02/2023.
//

import Foundation
import SwiftUI

struct Message : Identifiable {
    var id : String
    var texte : String
    var expediteur : String
    var destinataire : String
    var date : Date = Date()
    var isVue : Bool = false
    
    
    init(id : String , dict :[String:Any]){
        self.id = id
        self.texte = dict["TEXTE"] as? String ?? ""
        self.expediteur = dict["EXPEDITEUR"] as? String ?? ""
        self.destinataire = dict["DESTINATAIRE"] as? String ?? ""
        self.date = Date()
        self.isVue = false
        
    }
    
}
