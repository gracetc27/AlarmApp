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
            saveAlarms()
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

    func schedule(localNotification: Alarm) async {
        let content = UNMutableNotificationContent()

        content.body = NSLocalizedString(localNotification.body, comment: "")
        content.sound = customSound(soundName: localNotification.sounds)
        let dateComponents = localNotification.endDateComponents
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: localNotification.repeats)
        let request = UNNotificationRequest(
            identifier: localNotification.id,
            content: content,
            trigger: trigger)

        try? await notificationCenter.add(request)

        pendingAlarms = await notificationCenter.pendingNotificationRequests()
    }

    func customSound(soundName: SoundConstants, fileExtension: String = "") -> UNNotificationSound? {
        let period = fileExtension.isEmpty ? "" : "."
        let fileName = "\(soundName.rawValue)\(period)\(fileExtension)"

        return UNNotificationSound(named: UNNotificationSoundName(rawValue: fileName))
    }

    func saveAlarms() {
        if let data = try? JSONEncoder().encode(alarmViewModels) {
            UserDefaults.standard.set(data, forKey: itemKey)
        }
    }

    func removeRequest(id: String) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [id])

        if let index = pendingAlarms.firstIndex(where: { $0.identifier == id }) {
            pendingAlarms.remove(at: index)
        }

    }

    func safeAppend(localNotification: Alarm) {
        if let index = alarmViewModels.firstIndex(where: { $0.id == localNotification.id }) {
            alarmViewModels[index] = localNotification
        } else {
            alarmViewModels.append(localNotification)
        }
        alarmViewModels = alarmViewModels.sorted(by: { $0.endTime < $1.endTime})
    }

    override init() {
        super.init()
        notificationCenter.delegate = self
        guard let data = UserDefaults.standard.data(forKey: itemKey),
              let savedItems = try? JSONDecoder().decode([Alarm].self, from: data) else {
            return
        }
        self.alarmViewModels = savedItems
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        pendingAlarms = await notificationCenter.pendingNotificationRequests()

        let notificationId = notification.request.identifier
        if let index = alarmViewModels.firstIndex(where:  { $0.id == notificationId }) {
            if alarmViewModels[index].repeats == false {
                alarmViewModels[index].alarmEnabled = false
            }
        }

        return [.sound, .banner]
    }
}
