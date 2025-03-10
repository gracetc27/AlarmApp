//
//  LocalNotificationManager.swift
//  AlarmApp
//
//  Created by Grace couch on 10/03/2025.
//
import Foundation
import NotificationCenter

@MainActor
@Observable
class LocalNotificationManager: NSObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    var isAuthorized = false

    func requestAuthorization() async throws {
        try await notificationCenter.requestAuthorization(options: [.sound, .badge, .alert])
        await getCurrentSettings()
    }

    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isAuthorized = currentSettings.authorizationStatus == .authorized
    }

    func openSettings() async {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                await UIApplication.shared.open(url)
            }
        }
    }
}
