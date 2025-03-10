//
//  AlarmAppApp.swift
//  AlarmApp
//
//  Created by Grace couch on 25/02/2025.
//

import SwiftUI

@main
struct AlarmAppApp: App {
    @State private var localNotificationsManager = LocalNotificationsManager()
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
        .environment(localNotificationsManager)
    }
}
