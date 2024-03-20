//
//  DeletableRowView.swift
//  Habify
//
//  Created by nezzar dalia on 20/03/2024.
//

import SwiftUI

struct DeletableRowView: View {
    @State private var offset: CGFloat = 0
    @State private var isDeleting = false
    @State private var opacity: Double = 1.0
    var habits: Habit
    @EnvironmentObject var habitsViewModel: HabitsViewModel

    var body: some View {
        ZStack(alignment: .trailing) {
            
            Color.red
                .frame(width: isDeleting ? 340 : offset, height: 76)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .padding(.trailing, 50)
                )
                .offset(x: isDeleting ? 0 : -offset)
                .animation(.easeInOut(duration: 3), value: isDeleting)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isDeleting = false
                    }
                }
            
            RowView(habits: habits)
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width > 0 {
                                offset = value.translation.width
                            }
                        }
                        .onEnded { value in
                            if value.translation.width > 100 {
                                isDeleting = true
                                withAnimation {
                                    habitsViewModel.deleteHabit(habit: habits)
                                }
                            } else {
                                withAnimation {
                                    offset = 0
                                }
                            }
                        }
                )
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .frame(width: 340, height: 76)
        .opacity(isDeleting ? 0 : 1)
        .animation(.easeInOut(duration: 0.3), value: isDeleting)
    }
}



struct DeletableRowView_Previews: PreviewProvider {
    static var previews: some View {
        DeletableRowView(habits: Habit.testData[0])
            .environmentObject(HabitsViewModel())
            .previewLayout(.sizeThatFits)
    }
}
