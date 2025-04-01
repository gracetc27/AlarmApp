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

    init(currentAlarmIndex: Int?) {
        let viewModel = ChooseAddEditAlarmViewModel(currentAlarmIndex: currentAlarmIndex)
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
            .onAppear {
                if let currentAlarmIndex = chooseAddEditAlarmVM.currentAlarmIndex {
                    chooseAddEditAlarmVM.alarmModel = localNotificationManager.alarmViewModels[currentAlarmIndex]
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(chooseAddEditAlarmVM.currentAlarmIndex == nil ? "Add" : "Save") {
                        if let currentAlarmIndex = chooseAddEditAlarmVM.currentAlarmIndex {
                            localNotificationManager.alarmViewModels[currentAlarmIndex] = chooseAddEditAlarmVM.alarmModel
                        } else {
                            localNotificationManager.safeAppend(localNotification: chooseAddEditAlarmVM.alarmModel)
                        }
                        stopSound()

                        dismiss()
                        Task {
                            if chooseAddEditAlarmVM.alarmModel.alarmEnabled {
                                await localNotificationManager.schedule(localNotification: chooseAddEditAlarmVM.alarmModel)
                            } else {
                                localNotificationManager.removeRequest(id: chooseAddEditAlarmVM.alarmModel.id)
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
