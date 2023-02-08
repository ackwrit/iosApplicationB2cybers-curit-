//
//  PHPPickerRepresentable.swift
//  chatApp
//
//  Created by Djino Dissingar on 07/02/2023.
//
import Foundation
import UIKit
import SwiftUI
import PhotosUI

struct PHPPickerRepresentable : UIViewControllerRepresentable {
    //Deux constantes
    let image : (UIImage?) -> Void
    @Environment(\.presentationMode) var isPres
    
    init(image: @escaping (UIImage?) -> Void) {
        self.image = image
        
    }
    
    func dismiss(){
        self.isPres.wrappedValue.dismiss()
    }
    
    func makeUIViewController(context: Context) -> some  PHPickerViewController {
        var conf = PHPickerConfiguration()
        conf.selectionLimit = 1
        conf.filter = .images
        let picker = PHPickerViewController(configuration: conf)
        picker.delegate = context.coordinator
        return picker
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print("Mise à jour")
    }
    
    func makeCoordinator() -> PHPPIckerCoordinator {
        PHPPIckerCoordinator(image: image, dismiss: dismiss)
    }
    
}

class PHPPIckerCoordinator : NSObject,PHPickerViewControllerDelegate {
    //attributs
    let image : (UIImage?) -> Void
    let dismiss : () -> Void
    
    init(image: @escaping (UIImage?) -> Void, dismiss: @escaping () -> Void) {
        self.image = image
        self.dismiss = dismiss
    }
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        for result in results {
            let item = result.itemProvider
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self) { image, errors in
                    if let img = image as? UIImage {
                        self.image(img)
                    }
                }
            }
        }
    }
    
}
