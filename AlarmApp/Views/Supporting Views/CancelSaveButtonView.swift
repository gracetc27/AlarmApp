//
//  CancelSaveButtonView.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct CancelSaveButtonView: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: Alarm
    @Environment(LocalNotificationManager.self) var localNotificationManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {
            Button("Cancel", role: .destructive) {
                stopSound()
                dismiss()
            }

            Spacer()

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
        .padding()
    }
}

#Preview {
    CancelSaveButtonView(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
        .environment(LocalNotificationManager())
}
