//
//  ChooseAddEditAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 24/03/2025.
//

import SwiftUI


struct ChooseAddEditAlarmView: View {
    @Environment(LocalNotificationManager.self) private var localNotificationManager
    @Environment(\.dismiss) private var dismiss
    @State private var chooseAddEditAlarmVM: ChooseAddEditAlarmViewModel

    init(alarmModel: Alarm?) {
        let viewModel = ChooseAddEditAlarmViewModel(alarmModel: alarmModel)
        self._chooseAddEditAlarmVM = State(initialValue: viewModel)
    }

    var body: some View {
        
        NavigationStack {
            VStack {
                Picker("Alarm Type", selection: $chooseAddEditAlarmVM.alarmViewType) {
                    ForEach(AlarmViewType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                if chooseAddEditAlarmVM.alarmViewType == .standard {
                    AddEditAlarmView(alarmModel: $chooseAddEditAlarmVM.alarmModel)
                } else {
                    AddEditCircularAlarmView(alarmModel: $chooseAddEditAlarmVM.alarmModel)
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(chooseAddEditAlarmVM.isNewAlarm ? "Add" : "Save") {
                        let alarmModel = chooseAddEditAlarmVM.alarmModel
                        localNotificationManager.safeAppend(alarm: alarmModel)
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
    ChooseAddEditAlarmView(alarmModel: nil)
        .environment(LocalNotificationManager())
}
