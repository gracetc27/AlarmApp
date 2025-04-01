//
//  MainAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 25/02/2025.
//

import SwiftUI

struct MainAlarmView: View {
    @Environment(LocalNotificationManager.self) var localNotificationManager
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        TabView {
            if localNotificationManager.isAuthorized {
                AlarmListView()
                    .tabItem {
                        Image(systemName: "alarm.fill")
                    }
                AboutView()
                    .tabItem {
                        Image(systemName: "info.circle.fill")
                    }
            } else {
                EnableNotifView()
            }
        }
        .ignoresSafeArea()
        .task {
            try? await localNotificationManager.requestAuthorization()
        }
        .onChange(of: scenePhase) { _ , newValue in
            if newValue == .active {
                Task {
                    await localNotificationManager.getCurrentSettings()
                    await localNotificationManager.getPendingAlarms()
                }
            }
        }
    }
}

#Preview {
    MainAlarmView()
        .environment(LocalNotificationManager())
}
