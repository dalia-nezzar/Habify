//
//  ThemeManager.swift
//  Habify
//
//  Created by thiam mame diarra on 02/04/2024.
//

import Foundation
import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    @Published var colorScheme: ColorScheme = .light {
        willSet {
            objectWillChange.send()
            UserDefaults.standard.setValue(newValue == .dark, forKey: "darkMode")
        }
    }

    init() {
        self.colorScheme = (UserDefaults.standard.value(forKey: "darkMode") as? Bool) ?? false ? .dark : .light
    }
}
