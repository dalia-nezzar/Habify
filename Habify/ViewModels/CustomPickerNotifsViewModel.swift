//
//  CustomPickerNotifsViewModel.swift
//  Habify
//
//  Created by thiam mame diarra on 18/03/2024.
//

import SwiftUI
import Combine
import Foundation

class CustomPickerNotifsViewModel: ObservableObject {
    @Published var isSheetPresented = false
    @Published var selectedDate = Date()
    @Published var selectedHour = ""

    func updateHour(for hour: Binding<String>) {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let newHour = formatter.string(from: selectedDate)
        DispatchQueue.main.async {
            hour.wrappedValue = newHour
        }
    }
}


