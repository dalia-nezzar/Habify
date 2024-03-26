//
//  Statistics.swift
//  Habify
//
//  Created by thiam mame diarra on 21/03/2024.
//

import Foundation

struct Statistics {
    var habitsDone: Int = 0
    var lastFiveDays: [Date] = []
    var habitsCompletedLastFiveDays: [[Habit]] = []
    var currentDay: Int = 1
    
    mutating func updateStatistics() {
        countHabitsCompletedToday()
        updateLastFiveDays()
        currentDay += 1
    }
    
    private mutating func countHabitsCompletedToday() {
        let today = habitsCompletedLastFiveDays.first ?? []
        let completedHabitsToday = today.filter { $0.state == true }.count
        habitsDone += completedHabitsToday
    }
    
    private mutating func updateLastFiveDays() {
        if lastFiveDays.count == 5 {
            lastFiveDays.removeFirst()
            habitsCompletedLastFiveDays.removeFirst()
        }
        
        lastFiveDays.append(Date())
        habitsCompletedLastFiveDays.append([])
    }
}
