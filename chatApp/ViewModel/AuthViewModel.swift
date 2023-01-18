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
}
