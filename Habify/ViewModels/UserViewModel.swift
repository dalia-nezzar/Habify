//
//  UserViewModel.swift
//  Habify
//
//  Created by nezzar dalia on 15/03/2024.
//

import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @Published var user: User
    
    static let shared = UserViewModel(user: User())

    init(user: User) {
        self.user = user
    }
    
    func setUser(name: String) {
        self.user.nameUser = name
    }

    func getUserName() -> String {
        return user.nameUser.isEmpty ? "John Doe" : user.nameUser
    }
    
    func setImage(name: String) {
        self.user.profilePhoto = name
    }
    
}
