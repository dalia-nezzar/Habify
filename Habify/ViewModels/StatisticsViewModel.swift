//
//  StatisticsViewModel.swift
//  Habify
//
//  Created by thiam mame diarra on 21/03/2024.
//

import Foundation
import Combine

class StatisticsViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var lastFiveDays: [String] = []
    @Published var habitsCompletedToday: Int = 0
    @Published var totalHabits: Int = 0
    @Published var completionPercentage: Double = 0
    @Published var morningCompletionPercentage: Double = 0
    @Published var afternoonCompletionPercentage: Double = 0
    @Published var nightCompletionPercentage: Double = 0
    
    private var habitsViewModel = HabitsViewModel()
    
    private var statistics = Statistics()
    private var selectedDayIndex = 0
    
    init() {
            // Observer les changements dans la liste des habitudes
            habitsViewModel.$habits.sink { [weak self] habits in
                self?.updateStatistics()
            }.store(in: &cancellables)
        }
    
    func updateStatistics() {
        updateLastFiveDays()
        updateCompletionPercentages()
    }
    
    private func updateLastFiveDays() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        var days = [String]()
        for i in 0..<5 {
            if let date = Calendar.current.date(byAdding: .day, value: -i, to: Date()) {
                if i == 0 {
                    days.append("Today")
                } else if i == 1 {
                    dateFormatter.dateFormat = "MMMM d"
                    let dayString = dateFormatter.string(from: date)
                    days.append(dayString)
                } else {
                    let dayString = dateFormatter.string(from: date)
                    days.append(dayString)
                }
            }
        }
        self.lastFiveDays = days.reversed()
    }
    
    private func updateCompletionPercentages() {
        if selectedDayIndex < statistics.habitsCompletedLastFiveDays.count {
            habitsCompletedToday = statistics.habitsCompletedLastFiveDays[selectedDayIndex].filter { $0.state }.count
            totalHabits = statistics.habitsCompletedLastFiveDays[selectedDayIndex].count
            let totalHabitsCompleted = statistics.habitsCompletedLastFiveDays.flatMap { $0 }.filter { $0.state }.count
            let totalHabitsCount = statistics.habitsCompletedLastFiveDays.flatMap { $0 }.count
            completionPercentage = totalHabitsCount > 0 ? (Double(totalHabitsCompleted) / Double(totalHabitsCount)) * 100 : 0
            
            let morningHabitsCompleted = statistics.habitsCompletedLastFiveDays[selectedDayIndex].filter { $0.period == .morning && $0.state }.count
            let morningTotalHabits = statistics.habitsCompletedLastFiveDays[selectedDayIndex].filter { $0.period == .morning }.count
            morningCompletionPercentage = morningTotalHabits > 0 ? (Double(morningHabitsCompleted) / Double(morningTotalHabits)) * 100 : 0
            
            let afternoonHabitsCompleted = statistics.habitsCompletedLastFiveDays[selectedDayIndex].filter { $0.period == .afternoon && $0.state }.count
            let afternoonTotalHabits = statistics.habitsCompletedLastFiveDays[selectedDayIndex].filter { $0.period == .afternoon }.count
            afternoonCompletionPercentage = afternoonTotalHabits > 0 ? (Double(afternoonHabitsCompleted) / Double(afternoonTotalHabits)) * 100 : 0
            
            let nightHabitsCompleted = statistics.habitsCompletedLastFiveDays[selectedDayIndex].filter { $0.period == .night && $0.state }.count
            let nightTotalHabits = statistics.habitsCompletedLastFiveDays[selectedDayIndex].filter { $0.period == .night }.count
            nightCompletionPercentage = nightTotalHabits > 0 ? (Double(nightHabitsCompleted) / Double(nightTotalHabits)) * 100 : 0
        }
    }
    
    // Function to advance to the next day
    func advanceToNextDay() {
        let currentDate = Date()
        if let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) {
            // Définissez la date actuelle de l'appareil sur la nouvelle date
            // Notez que cela ne fonctionnera pas sur un appareil réel, mais uniquement dans le simulateur.
            // Cela modifiera également la date pour toute l'application, pas seulement pour cette vue.
            UserDefaults.standard.set(nextDay, forKey: "savedDate")
            
            // Vous pouvez également rafraîchir votre vue ou effectuer d'autres actions nécessaires ici.
        }
    }

}
