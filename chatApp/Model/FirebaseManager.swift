//
//  FirebaseManager.swift
//  chatApp
//
//  Created by Djino Dissingar on 18/01/2023.
//

import Foundation
import Firebase
import UIKit
import FirebaseStorage


// La classe qui permet la connexion à la base de donnée

class FirebaseManager {
    static let shared = FirebaseManager()
    
    var auth : Auth
    var cloudFirestore : Firestore
    var storage : Storage
    
    init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        auth = Auth.auth()
        cloudFirestore = Firestore.firestore()
        storage = Storage.storage()
    }
    
    var userRef : CollectionReference {
        return cloudFirestore.collection("UTILISATEURS")
    }
    
    var storageRef : StorageReference {
        return storage.reference(withPath: "ImageProfils")
    }
    
    var messageRef : CollectionReference {
        return cloudFirestore.collection("MESSAGES")
    }
    
    
    
    
    func addUser(uid : String , map :[String:Any]){
        userRef.document(uid).setData(map)
    }
    
    func addMessage(uid : String , map : [String : Any]){
        let date = Date()
        let id = uid + "\(date)"
        messageRef.document(id).setData(map)
    }
    
    func myId() -> String {
        return auth.currentUser?.uid ?? ""
        
    }
    
    func getId() -> String?{
        return auth.currentUser?.uid ?? ""
        
    }
    func UpadteUser(key : String ,datas : Any){
        let id = getId() ?? ""
        userRef.document(id).updateData([key : datas])
    }
    
    func logOut(){
        do {
            try auth.signOut()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func upDateImage(image : UIImage?){
        upLoadImage(image: image) { imgUrl in
            if let url = imgUrl {
                self.UpadteUser(key: "AVATAR", datas: url)
            }
           
            
        }
    }
    
    func upLoadImage(image : UIImage? ,completion : @escaping (String?) -> Void){
        
        //récuperer notre identifant (renommer l'image avec notre identifant)
        if let img = image {
            if let _ = img.jpegData(compressionQuality: 0.25){
                if let currentId = getId() {
                    let path = storageRef.child(currentId)
                    path.downloadURL { url, error in
                        if let error = error {
                            print(error.localizedDescription)
                            completion(nil)
                        }
                        completion(url?.absoluteString)
                    }
                }
                else
                {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
        else
        {
            completion(nil)
        }
        
         
        //Récuperer l'url de notre image
        
        //Stocker dans la base donnée
        
    }
    

}
