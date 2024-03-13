//
//  CustomPicker.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import SwiftUI
import Foundation

struct CustomPicker: View {
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .foregroundColor(isSelected ? .white : Color("MainIconColor"))
                    .if(icon == "sunrise.fill") { content in
                        content
                        .aspectRatio(contentMode: .fit) }
                    .frame(width: 40, height: 40)
            }
            .padding(.horizontal)
            .frame(width: 100, height: 85)
            .background(isSelected ? Color("MainGreen") : Color("BackgroundCustomPicker"))
            .cornerRadius(6)
            
        }
    }
}
