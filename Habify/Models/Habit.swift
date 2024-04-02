//
//  Habit.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import Foundation
import SwiftUI

enum Period: String, CaseIterable {
    case all = "all"
    case morning = "morning"
    case afternoon = "afternoon"
    case night = "night"
    
    var colorsFilter : Color{
        switch self {
        case .all:
            return Color.black
        case .morning:
            return Color("filterMorning")
        case .afternoon:
            return Color("filterAfternoon")
        case .night:
            return Color("filterNight")
        }
    }
    
    var colorsHabit : Color {
        switch self {
        case .all:
            return Color.black
        case .morning:
            return Color("habitMorning")
        case .afternoon:
            return Color("habitAfternoon")
        case .night:
            return Color("habitNight")
        }
    }
    
    var iconPeriod : String {
        switch self {
        case .all :
            return "filemenu.and.selection"
        case .morning :
            return "sunrise.fill"
        case .afternoon :
            return "sun.max.fill"
        case .night :
            return "moon.stars.fill"
        }
    }
    
}

struct Habit: Identifiable {
    var id = UUID()
    var title: String
    var state: Bool
    var period: Period
    var date: Date
    
    static let calendar = Calendar.current
    
    static var testData: [Habit] {
        let today = calendar.startOfDay(for: Date())
        let startDate = calendar.date(byAdding: .day, value: -5, to: today)!
        return [
            Habit(title: "Learn React JS", state: false, period: .morning, date: today),
            Habit(title: "Go Workout", state: false, period: .afternoon, date: today),
            Habit(title: "Draw an animal", state: false, period: .night, date: today),
            Habit(title: "Read my book", state: false, period: .night, date: today),
            Habit(title: "Do 50 pushes", state: false, period: .morning, date: today),
            Habit(title: "Go to a night club", state: false, period: .night, date: today),
            Habit(title: "Sleep", state: false, period: .night, date: today),
            Habit(title: "Adopt a dog", state: false, period: .afternoon, date: today),
            
            Habit(title: "Learn React JS", state: true, period: .morning, date: calendar.date(byAdding: .day, value: 1, to: startDate)!),
            Habit(title: "Go Workout", state: true, period: .afternoon, date: calendar.date(byAdding: .day, value: 1, to: startDate)!),
            Habit(title: "Draw an animal", state: false, period: .night, date: calendar.date(byAdding: .day, value: 1, to: startDate)!),
            Habit(title: "Read my book", state: true, period: .night, date: calendar.date(byAdding: .day, value: 1, to: startDate)!),
            Habit(title: "Do 50 pushes", state: true, period: .morning, date: calendar.date(byAdding: .day, value: 1, to: startDate)!),
            
            Habit(title: "Learn React JS", state: true, period: .morning, date: calendar.date(byAdding: .day, value: 2, to: startDate)!),
            Habit(title: "Go Workout", state: true, period: .afternoon, date: calendar.date(byAdding: .day, value: 2, to: startDate)!),
            Habit(title: "Draw an animal", state: true, period: .night, date: calendar.date(byAdding: .day, value: 2, to: startDate)!),
            Habit(title: "Read my book", state: true, period: .night, date: calendar.date(byAdding: .day, value: 2, to: startDate)!),
            Habit(title: "Do 50 pushes", state: true, period: .morning, date: calendar.date(byAdding: .day, value: 2, to: startDate)!),
            Habit(title: "Go to a night club", state: false, period: .night, date: calendar.date(byAdding: .day, value: 2, to: startDate)!),
            Habit(title: "Sleep", state: true, period: .night, date: calendar.date(byAdding: .day, value: 2, to: startDate)!),
            Habit(title: "Adopt a dog", state: false, period: .afternoon, date: calendar.date(byAdding: .day, value: 2, to: startDate)!),
            
            Habit(title: "Learn React JS", state: true, period: .morning, date: calendar.date(byAdding: .day, value: 3, to: startDate)!),
            Habit(title: "Go Workout", state: true, period: .afternoon, date: calendar.date(byAdding: .day, value: 3, to: startDate)!),
            Habit(title: "Draw an animal", state: false, period: .night, date: calendar.date(byAdding: .day, value: 3, to: startDate)!),
            Habit(title: "Read my book", state: true, period: .night, date: calendar.date(byAdding: .day, value: 3, to: startDate)!),
            Habit(title: "Do 50 pushes", state: true, period: .morning, date: calendar.date(byAdding: .day, value: 3, to: startDate)!),
            Habit(title: "Go to a night club", state: false, period: .night, date: calendar.date(byAdding: .day, value: 3, to: startDate)!),
            Habit(title: "Sleep", state: false, period: .night, date: calendar.date(byAdding: .day, value: 3, to: startDate)!),
            Habit(title: "Adopt a dog", state: false, period: .afternoon, date: calendar.date(byAdding: .day, value: 3, to: startDate)!),
            
            Habit(title: "Learn React JS", state: true, period: .morning, date: calendar.date(byAdding: .day, value: 4, to: startDate)!),
            Habit(title: "Go Workout", state: true, period: .afternoon, date: calendar.date(byAdding: .day, value: 4, to: startDate)!),
            Habit(title: "Draw an animal", state: false, period: .night, date: calendar.date(byAdding: .day, value: 4, to: startDate)!),
            Habit(title: "Read my book", state: true, period: .night, date: calendar.date(byAdding: .day, value: 4, to: startDate)!),
            Habit(title: "Do 50 pushes", state: true, period: .morning, date: calendar.date(byAdding: .day, value: 4, to: startDate)!),
            Habit(title: "Go to a night club", state: false, period: .night, date: calendar.date(byAdding: .day, value: 4, to: startDate)!),
            Habit(title: "Sleep", state: false, period: .night, date: calendar.date(byAdding: .day, value: 4, to: startDate)!),
            Habit(title: "Adopt a dog", state: false, period: .afternoon, date: calendar.date(byAdding: .day, value: 4, to: startDate)!)
            
            

            
        ]
    }
}

