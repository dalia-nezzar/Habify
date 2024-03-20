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
    
    func onDeleteHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
    
    func deleteHabit(habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits.remove(at: index)
        }
    }
    
    func updateItem(habit: Habit) {
        for (index, hb) in habits.enumerated() {
            if hb.id == habit.id {
                habits[index].state.toggle()
            }
        }
    }
}
