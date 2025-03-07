//
//  MainAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 25/02/2025.
//

import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        TabView {
            AlarmListView(alarmModels: Alarm.DummyAlarmData())
                .tabItem {
                    Image(systemName: "alarm.fill")
                }
            AboutView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                }
        }
    }
}

#Preview {
    MainAlarmView()
}
