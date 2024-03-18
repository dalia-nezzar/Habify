//
//  NotificationManager.swift
//  Habify
//
//  Created by thiam mame diarra on 18/03/2024.
//

import Foundation
import UserNotifications

class NotificationManager: ObservableObject {
    static let shared = NotificationManager()

    private init() {}

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
        }
    }

    func scheduleNotification(hour: Int, minute: Int, second: Int, body: String) {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = body
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }

    func convertTimeStringToComponents(time: String) -> (hour: Int, minute: Int, second: Int)? {
        let hourMinuteSecond = time.split(separator: ":")

        guard hourMinuteSecond.count == 2 else {
            print("Invalid time format")
            return nil
        }

        let hour = Int(hourMinuteSecond[0])
        let minuteSecond = String(hourMinuteSecond[1]).split(separator: " ")
        let minute = Int(minuteSecond[0])
        let second = 0

        return (hour: hour ?? 0, minute: minute ?? 0, second: second)
    }
}
