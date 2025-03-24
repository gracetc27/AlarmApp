//
//  ChooseAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 24/03/2025.
//

import SwiftUI

enum AlarmViewType {
    case standard, circular
}

struct ChooseAlarmView: View {
    let alarmViewType: AlarmViewType
    @Binding var currentAlarmIndex: Int?
    @Environment(LocalNotificationManager.self) var localNotificationManager
    var body: some View {
        if let currentAlarmIndex = currentAlarmIndex {
            if alarmViewType == .standard {
                AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: localNotificationManager.alarmViewModels[currentAlarmIndex])
            } else {
                AddEditCircularAlarmView(alarmModel: localNotificationManager.alarmViewModels[currentAlarmIndex], currentAlarmIndex: currentAlarmIndex)
            }
        } else {
            if alarmViewType == .standard {
                AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
            } else {
                AddEditCircularAlarmView(alarmModel: .DefaultAlarm(), currentAlarmIndex: nil)
            }
        }
    }
}

#Preview {
    ChooseAlarmView(alarmViewType: .circular, currentAlarmIndex: .constant(nil))
        .environment(LocalNotificationManager())
}
