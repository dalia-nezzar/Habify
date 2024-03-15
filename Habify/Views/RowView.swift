//
//  RowView.swift
//  Habify
//
//  Created by thiam mame diarra on 14/03/2024.
//

import SwiftUI

struct RowView: View {
    
    let habits : Habit
    

    var body: some View {
        Group {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                   
                    Text(habits.period.rawValue)
                        .font(.caption)
                        .frame(width: 80, height: 20)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(habits.period.colorsFilter)
                        )
                        .foregroundColor(Color("MainIconColor"))

                    Text(habits.title)
                        .font(.headline)
                        .bold()
                        .foregroundColor(Color("MainIconColor"))
                }
                Spacer()
                Image(systemName: habits.state ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("MainIconColor"))
                
            }
            .padding(15)
            .frame(width: 340, height: 76)
            .background(habits.state ? habits.period.colorsHabit : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal)
    }
    
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(habits: Habit.testData[0])
            .previewLayout(.sizeThatFits)
        RowView(habits: Habit.testData[1])
            .previewLayout(.sizeThatFits)
        RowView(habits: Habit.testData[2])
            .previewLayout(.sizeThatFits)
        RowView(habits: Habit.testData[3])
            .previewLayout(.sizeThatFits)
        RowView(habits: Habit.testData[4])
            .previewLayout(.sizeThatFits)
    }
}

