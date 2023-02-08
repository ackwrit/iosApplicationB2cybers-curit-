//
//  ImagePickerRepresentable.swift
//  chatApp
//
//  Created by Djino Dissingar on 07/02/2023.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePickerRepresentable : UIViewControllerRepresentable {
    @Environment(\.presentationMode) var isPres
    let image : (UIImage?) -> Void
    
    init(image: @escaping (UIImage?) -> Void) {
        self.image = image
    }
    
    func dismiss(){
        isPres.wrappedValue.dismiss()
    }
    
    
    
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = false
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        print("mise à jour")
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(dismiss: dismiss, image: image)
    }
}


class ImagePickerCoordinator : NSObject, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    let dismiss: () -> Void
    let image: (UIImage?) -> Void
    
    

    
    
    init(dismiss: @escaping () -> Void, image: @escaping (UIImage?) -> Void) {
        self.dismiss = dismiss
        self.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss()
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let newImage = info[.originalImage] as? UIImage {
            self.image(newImage)
        }
        dismiss()
    }
}
