//
//
//  ImagePickerViewController.swift
//  Habify
//
//  Created by nezzar dalia on 19/03/2024.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedImage: UIImage?
    var user: User
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var mediaTypes: [String]?
    var allowsEditing: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.allowsEditing = allowsEditing
        picker.delegate = context.coordinator
        if let mediaTypes = mediaTypes {
            picker.mediaTypes = mediaTypes
        }
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        var user: User // Ajoutez une référence au modèle User
        
        init(parent: ImagePicker) {
            self.parent = parent
            self.user = parent.user // Référence au modèle User
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let editedImage = info[.editedImage] as? UIImage {
                parent.selectedImage = editedImage
            } else if let originalImage = info[.originalImage] as? UIImage {
                parent.selectedImage = originalImage
            }
            // Appeler la fonction loadImage du modèle User lorsque l'image est sélectionnée
            if let selectedImage = parent.selectedImage {
                user.loadImage(selectedImage: selectedImage)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
