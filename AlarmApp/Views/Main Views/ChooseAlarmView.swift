//
//  ChooseAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 24/03/2025.
//

import SwiftUI

enum AlarmViewType: String, CaseIterable {
    case standard = "Standard"
    case circular = "Circular"
}

struct ChooseAlarmView: View {
    @Environment(LocalNotificationManager.self) var localNotificationManager
    @Environment(\.dismiss) var dismiss
    @State private var alarmModel: Alarm = .DefaultAlarm()
    @State private var alarmViewType: AlarmViewType = .standard
    @Binding var currentAlarmIndex: Int?

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Alarm Type", selection: $alarmViewType) {
                    ForEach(AlarmViewType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                if let currentAlarmIndex = currentAlarmIndex {
                    if alarmViewType == .standard {
                        ToBedWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: localNotificationManager.alarmViewModels[currentAlarmIndex])
                    } else {
                        AddEditCircularAlarmView(alarmModel: localNotificationManager.alarmViewModels[currentAlarmIndex], currentAlarmIndex: currentAlarmIndex)
                    }
                } else {
                    if alarmViewType == .standard {
                        ToBedWakeUpView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
                    } else {
                        AddEditCircularAlarmView(alarmModel: .DefaultAlarm(), currentAlarmIndex: nil)
                    }
                }
            }
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button(currentAlarmIndex == nil ? "Add" : "Save") {
                            if let currentAlarmIndex = currentAlarmIndex {
                                localNotificationManager.alarmViewModels[currentAlarmIndex] = alarmModel
                            } else {
                                localNotificationManager.safeAppend(localNotification: alarmModel)
                            }
                            stopSound()

                            dismiss()
                            Task {
                                if alarmModel.alarmEnabled {
                                    await localNotificationManager.schedule(localNotification: alarmModel)
                                } else {
                                    localNotificationManager.removeRequest(id: alarmModel.id)
                                }
                            }
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .destructive) {
                            stopSound()
                            dismiss()
                        }
                        .tint(.red)
                    }
                }
        }
    }
}

#Preview {
    ChooseAlarmView(currentAlarmIndex: .constant(nil))
        .environment(LocalNotificationManager())
}
