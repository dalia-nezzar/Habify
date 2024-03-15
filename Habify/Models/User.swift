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
    @Published var nameUser: String = ""
    @Published var profilePhoto: String = "IconUser"
    
}
