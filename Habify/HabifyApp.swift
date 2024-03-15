//
//  HabifyApp.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import SwiftUI

@main
struct HabifyApp: App {
    var body: some Scene {


        WindowGroup {
            WelcomeView()
                .environmentObject(HabitsViewModel())
                .environmentObject(UserViewModel(user: User()))
        }
    }
}
