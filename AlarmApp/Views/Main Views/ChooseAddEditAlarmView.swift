//
//  ChooseAddEditAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 24/03/2025.
//

import SwiftUI

enum AlarmViewType: String, CaseIterable {
    case standard = "Standard"
    case circular = "Circular"
}

struct ChooseAddEditAlarmView: View {
    @Environment(LocalNotificationManager.self) var localNotificationManager
    @Environment(\.dismiss) var dismiss
    @State private var alarmModel: Alarm = .DefaultAlarm()
    @State private var alarmViewType: AlarmViewType = .standard
    let currentAlarmIndex: Int?

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
                        AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: localNotificationManager.alarmViewModels[currentAlarmIndex])
                    } else {
                        AddEditCircularAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: localNotificationManager.alarmViewModels[currentAlarmIndex])
                    }
                } else {
                    if alarmViewType == .standard {
                        AddEditAlarmView(currentAlarmIndex: nil, alarmModel: alarmModel)
                    } else {
                        AddEditCircularAlarmView(currentAlarmIndex: nil, alarmModel: alarmModel)
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
    ChooseAddEditAlarmView(currentAlarmIndex: nil)
        .environment(LocalNotificationManager())
}
