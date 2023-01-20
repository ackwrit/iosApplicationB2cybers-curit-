//
//  AuthViewModel.swift
//  chatApp
//
//  Created by Djino Dissingar on 18/01/2023.
//

import Foundation
import Firebase

class AuthViewModel : ObservableObject {
    var manager = FirebaseManager.shared
    
    @Published var isFinishConnecting : Bool = false
    @Published var isAuth : Bool = false
    @Published var showError : Bool = false
    
    var erroString : String = ""
    var datas : [String: Any] = [:]
    
    var auth : Auth {
        return manager.auth
    }
    
    init(){
        observeAuthentification()
    }
    
    
    func observeAuthentification(){
        auth.addStateDidChangeListener(handleListener)
    }
    
    
    func handleListener (auth : Auth , user : User?){
        self.isFinishConnecting = true
        self.isAuth = user != nil
    }
    
    //pour connecter l'utilisateur
    func ConnectUser(){
        
    }
    
    
    
    //Création de l'utilisateur dans la base de donnée
    func CreateUser(mail : String , password : String , prenom : String , nom : String){
        guard checkValue(mail, value: "mail") else {return}
        guard checkValue(password, value: "mot de passe") else {return}
        guard checkValue(prenom, value: "prénom") else {return}
        guard checkValue(nom, value: "nom") else {return}
        auth.createUser(withEmail: mail, password: password)
    }
    
    func checkValue(_ string : String , value : String) -> Bool{
        let isEmpty =  string != ""
        self.showError = !isEmpty
        self.erroString = !isEmpty ? "Entrer votre \(value)": ""
        return isEmpty
    }
}
