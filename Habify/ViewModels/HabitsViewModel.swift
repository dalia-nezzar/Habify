//
//  HabitsViewModel.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import Foundation

class HabitsViewModel: ObservableObject {
    
    @Published var habits: [Habit] = []
    
    init() {
        getHabits()
    }
    
    func getHabits() {
        habits.append(contentsOf: Habit.testData)
    }
    
    func addHabit(title: String, period: Period) {
        let newHabit = Habit(title: title, state: false, period: period)
        habits.append(newHabit)
    }
    
    func deleteHabit(indexSet: IndexSet) {
        habits.remove(atOffsets: indexSet)
    }
    
    func updateItem(habit: Habit) {
        for (index, hb) in habits.enumerated() {
            if hb.id == habit.id {
                habits[index].state.toggle()
            }
        }
    }
}
