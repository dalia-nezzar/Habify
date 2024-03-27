//
//  HabitsViewModel.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import Foundation

class HabitsViewModel: ObservableObject {
    
    @Published var habits: [Habit] = []
    @Published var stats : [Statistics] = []
    
    private var timer: Timer?
    

    
    init() {
        getHabits()
        stats = [Statistics()]
        let nextResetDate = nextResetDate()
        timer = Timer(fire: nextResetDate, interval: 86400, repeats: true) { [weak self] _ in
            self?.resetHabitsForNewDay()
        }
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    func getHabits() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        habits = Habit.testData.filter { calendar.isDate($0.date, inSameDayAs: today) }
    }
    
    func getHabits(for date: Date) -> [Habit] {
        let calendar = Calendar.current
        let habitsOnDate = Habit.testData.filter { calendar.isDate($0.date, inSameDayAs: date) }
        return habitsOnDate
    }
    
    func addHabit(title: String, period: Period) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let newHabit = Habit(title: title, state: false, period: period, date: today)
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
                if !habit.state {
                    if !stats.isEmpty {
                        stats[0].totalHabitsDone += 1
                    }
                }
                habits[index].state.toggle()
            }
        }
    }

    
    func totalHabitsDoneSinceInstallation() -> Int {
        return stats.first?.totalHabitsDone ?? 0
    }
    
    func totalHabitsDone() -> Int {
        return habits.filter { $0.state == true }.count
    }
    
    func totalHabits() -> Int {
        return habits.count
    }
    
    func percentageOfHabitsDoneForPeriod(in period: Period) -> Double {
        let totalHabits = Double(habits.filter { $0.period == period}.count)
        let doneHabits = Double(habits.filter { $0.period == period && $0.state == true}.count)
        return (doneHabits / totalHabits) * 100
    }
    
    func daysSinceInstallation() -> Int {
        guard let installationDate = stats.first?.installationDate else {
            return 0
        }
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: installationDate, to: currentDate)
        return components.day ?? 0
    }
    
    func percentageOfHabitsDoneToday() -> Double {
        let totalHabits = Double(habits.count)
        let doneHabits = Double(habits.filter({ $0.state == true }).count)
        return (doneHabits / totalHabits) * 100
    }
    
    func totalHabitsToday() -> Int {
        return habits.filter({ $0.state == true }).count
    }
    
    func habitsDoneAndTotal(for period: Period) -> (done: Int, total: Int) {
        let habitsForPeriod = habits.filter { $0.period == period }
        let habitsDone = habitsForPeriod.filter { $0.state == true }.count
        return (habitsDone, habitsForPeriod.count)
    }
    
    
    func resetHabitsForNewDay() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let habitsForToday = habits.filter { calendar.isDate($0.date, inSameDayAs: today) }

        // Calculez les habitudes faites et totales pour chaque période
        let (morningHabitsDone, morningHabitsTotal) = habitsDoneAndTotal(for: .morning)
        let (afternoonHabitsDone, afternoonHabitsTotal) = habitsDoneAndTotal(for: .afternoon)
        let (nightHabitsDone, nightHabitsTotal) = habitsDoneAndTotal(for: .night)

        // Stockez les habitudes actuelles dans DailyStat
        let dailyStat = DailyStat(date: today, habits: habitsForToday, habitsDone: totalHabitsDone(), totalHabits: totalHabits(), morningHabitsDone: morningHabitsDone, morningHabitsTotal: morningHabitsTotal, afternoonHabitsDone: afternoonHabitsDone, afternoonHabitsTotal: afternoonHabitsTotal, nightHabitsDone: nightHabitsDone, nightHabitsTotal: nightHabitsTotal)
        stats[0].dailyStats.append(dailyStat)

        // Réinitialisez les habitudes pour aujourd'hui
        for (index, _) in habitsForToday.enumerated() {
            habits[index].state = false
        }

        // Ajoutez des habitudes pour demain
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        let habitsForTomorrow = habits.filter { calendar.isDate($0.date, inSameDayAs: tomorrow) }

        for habit in habitsForTomorrow {
            let newHabit = Habit(title: habit.title, state: false, period: habit.period, date: habit.date)
            habits.append(newHabit)
        }

        // Triez les habitudes par date et heure
        habits.sort { $0.date < $1.date }
    }

    
    func nextResetDate() -> Date {
        let calendar = Calendar.current
        let now = Date()
        let midnight = calendar.startOfDay(for: now)
        let components = calendar.dateComponents([.hour, .minute, .second], from: now)
        let secondsUntilMidnight = components.hour! * 3600 + components.minute! * 60 + components.second!
        return calendar.date(byAdding: .second, value: 86400 - secondsUntilMidnight, to: midnight)!
    }
    
    
    deinit {
        timer?.invalidate()
    }

    
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////
    
    
    func totalHabitsDone(for date: Date) -> Int {
        let habitsOnDate = getHabits(for: date)
        return habitsOnDate.filter { $0.state == true }.count
    }
    
    
    func totalHabits(for date: Date) -> Int {
        return getHabits(for: date).count
    }

    
    func percentageOfHabitsDoneForPeriod(in period: Period, for date: Date) -> Double {
        let habitsOnDate = getHabits(for: date)
        let totalHabits = Double(habitsOnDate.filter { $0.period == period}.count)
        let doneHabits = Double(habitsOnDate.filter { $0.period == period && $0.state == true}.count)
        return (doneHabits / totalHabits) * 100
    }

    func percentageOfHabitsDoneToday(for date: Date) -> Double {
        let habitsOnDate = getHabits(for: date)
        let totalHabits = Double(habitsOnDate.count)
        let doneHabits = Double(habitsOnDate.filter({ $0.state == true }).count)
        return (doneHabits / totalHabits) * 100
    }
    
    func getLastFiveDaysStats() -> [(date: Date, habitsDone: Int)] {
        let calendar = Calendar.current
        var stats: [(date: Date, habitsDone: Int)] = []

        for i in 0..<5 {
            let date = calendar.date(byAdding: .day, value: -i, to: Date())!
            let habitsDone = totalHabitsDone(for: date)
            stats.append((date: date, habitsDone: habitsDone))
        }

        return stats
    }


    
    
}
