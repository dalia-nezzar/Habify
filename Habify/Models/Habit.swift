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
    
    static var testData = [
        Habit(title: "Learn React JS", state: true, period: .morning),
        Habit(title: "Go Workout", state: true, period: .afternoon),
        Habit(title: "Draw an animal", state: false, period: .night),
        Habit(title: "Read my book", state: true, period: .night),
        Habit(title: "Do 50 pushes", state: false, period: .morning)
    ]
}

