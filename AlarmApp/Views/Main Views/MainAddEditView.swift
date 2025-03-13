//
//  MainAddEditView.swift
//  AlarmApp
//
//  Created by Grace couch on 10/03/2025.
//

import SwiftUI

struct MainAddEditView: View {
    let currentAlarmIndex: Int?
    @State private var alarmModel: Alarm

    @State private var selectedTab = "One"

    init(currentAlarmIndex: Int? = nil, alarmModel: Alarm) {
        self.currentAlarmIndex = currentAlarmIndex
        self._alarmModel = State(initialValue: alarmModel)
    }
    var body: some View {
        TabView(selection: $selectedTab) {
            AddEditAlarmView(currentAlarmIndex: currentAlarmIndex)
                .tag("One")

            AddEditCircularAlarmView(alarmModel: alarmModel, currentAlarmIndex: currentAlarmIndex)
                .padding()
                .tag("Two")
        }
        .onAppear {
            UIPageControl
                .appearance()
                .currentPageIndicatorTintColor = .gray
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

#Preview {
    MainAddEditView(alarmModel: .DefaultAlarm())
        .environment(LocalNotificationManager())
}
