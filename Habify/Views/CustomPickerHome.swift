
//
//  CustomPicker.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import SwiftUI
import Foundation

struct CustomPickerHome: View {
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .foregroundColor(isSelected ? Color("MainIconColor") : .gray)
                    .if(icon == "sunrise.fill") { content in
                        content
                        .aspectRatio(contentMode: .fit) }
                    .frame(width: 40, height: 40)
            }
            .padding(.horizontal)
            .frame(width: 65, height: 55)
            .background(.clear)
            .cornerRadius(6)
        }
    }
}

