//
//  SwiftUIView.swift
//  Habify
//
//  Created by thiam mame diarra on 15/03/2024.
//

import SwiftUI

struct RowViewDeux: View {
    let habits: Habit
    
    var body: some View {
        HStack {
            Image(systemName: habits.state ? "checkmark.circle" : "circle")
                .foregroundColor(habits.state ? .green : .red)
            Text(habits.title)
            
            Spacer()
            
            
            Text(habits.period.rawValue)
                .font(.footnote)
                .padding(3)
                .foregroundStyle(Color(.systemGray2))
                .frame(minWidth: 62)
                .overlay(
                    Capsule()
                        .stroke(Color(.systemGray2),
                                lineWidth: 0.75)
                        
                )
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct RowViewDeux_Previews: PreviewProvider {
    static var previews: some View {
        RowViewDeux(habits: Habit.testData[0])
    }
}
