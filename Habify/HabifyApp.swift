//
//  HabifyApp.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import SwiftUI
import UserNotifications
import Combine

@main
struct HabifyApp: App {
    @StateObject var notificationManager = NotificationManager.shared
    var body: some Scene {
        WindowGroup {
            
            WelcomeView()
                .environmentObject(HabitsViewModel())
                .environmentObject(User())
                .onAppear {
                    notificationManager.requestAuthorization()
                }
        }
    }
}
