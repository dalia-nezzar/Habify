//
//  NotificationManager.swift
//  Habify
//
//  Created by thiam mame diarra on 18/03/2024.
//

import Foundation
import UserNotifications

class NotifsViewModel: ObservableObject {
    static let shared = NotifsViewModel()

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
    
    func sendNotification() {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Do your task with Habify"
        content.body = "Don't forget to check Habify! You still have tasks to complete. Stay on track and reach your goals."
        content.sound = .default
        content.userInfo = ["value": "Data with local notification"]
        
        // Créer le déclencheur de répétition toutes les 1 minute
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        // Créer la demande de notification
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        
        // Ajouter la demande de notification au centre de notification
        center.add(request) { error in
            if let error = error {
                print("Erreur lors de l'ajout de la notification: \(error.localizedDescription)")
            } else {
                print("Notification ajoutée avec succès.")
            }
        }
    }




    func someActionThatTriggersNotification() {
        // Exemple de logique métier : déclencher la notification seulement si une certaine condition est remplie
        let conditionIsMet = true // Mettez ici votre propre logique métier

        // Si la condition est remplie, déclencher la notification
        if conditionIsMet {
            // Appeler sendNotification() lorsque nécessaire
            sendNotification()
        }
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
