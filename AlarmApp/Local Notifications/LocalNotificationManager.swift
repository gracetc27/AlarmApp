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
    var isAuthorized = false
    var pendingAlarms: [UNNotificationRequest] = []
    var alarmViewModels: [Alarm] = [] {
        didSet {
            
        }
    }

    let notificationCenter = UNUserNotificationCenter.current()
    let itemKey = "Alarm List"

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

    func getPendingAlarms() async {
        pendingAlarms = await notificationCenter.pendingNotificationRequests()
    }

    func saveAlarms() {
        if let data = try? JSONEncoder().encode(alarmViewModels) {
            UserDefaults.standard.set(data, forKey: itemKey)
        }
    }

    override init() {
        super.init()
        guard let data = UserDefaults.standard.data(forKey: itemKey),
              let savedItems = try? JSONDecoder().decode([Alarm].self, from: data) else {
            return
        }
        self.alarmViewModels = savedItems
    }
}
