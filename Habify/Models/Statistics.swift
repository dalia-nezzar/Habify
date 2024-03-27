//
//  Statistics.swift
//  Habify
//
//  Created by thiam mame diarra on 21/03/2024.
//

import Foundation

struct Statistics {
    var daysSinceInstallation: Int
    var installationDate: Date
    var totalHabitsDone: Int
    var dailyStats: [DailyStat]

    init() {
        self.installationDate = Date()
        self.daysSinceInstallation = 0
        self.totalHabitsDone = 0
        self.dailyStats = []
    }
}

struct DailyStat {
    var date: Date
    var habits: [Habit]
    var habitsDone: Int
    var totalHabits: Int
    var morningHabitsDone: Int
    var morningHabitsTotal: Int
    var afternoonHabitsDone: Int
    var afternoonHabitsTotal: Int
    var nightHabitsDone: Int
    var nightHabitsTotal: Int
}

