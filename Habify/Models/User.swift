//
//  User.swift
//  Habify
//
//  Created by nezzar dalia on 15/03/2024.
//

import Foundation
import SwiftUI
import Combine

class User: ObservableObject {
    @Published var nameUser: String = "John Doe"
    @Published var profilePhoto: String = "IconUser"

    func loadImage(selectedImage: UIImage) {
        if let imageData = selectedImage.jpegData(compressionQuality: 0.5) {
            let base64String = imageData.base64EncodedString()
            profilePhoto = base64String
        }
    }
    
}
