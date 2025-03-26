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
    @Environment(LocalNotificationManager.self) private var localNotificationManager
    @Environment(\.dismiss) private var dismiss
    @State private var alarmModel: Alarm = .DefaultAlarm()
    @State private var alarmViewType: AlarmViewType = .standard
    private let currentAlarmIndex: Int?

    init(currentAlarmIndex: Int?) {
        self.currentAlarmIndex = currentAlarmIndex
    }

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

                if alarmViewType == .standard {
                    AddEditAlarmView(alarmModel: $alarmModel)
                } else {
                    AddEditCircularAlarmView(alarmModel: $alarmModel)
                }
            }
            .onAppear {
                if let currentAlarmIndex {
                    alarmModel = localNotificationManager.alarmViewModels[currentAlarmIndex]
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
