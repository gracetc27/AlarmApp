//
//  AlarmListView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct AlarmListView: View {
    @Environment(LocalNotificationManager.self) var localNotificationManager

    @State private var alarmListVM = AlarmListViewModel()

    var body: some View {
        @Bindable var localNotificationManager = localNotificationManager
        NavigationStack {
            List {
                ForEach($localNotificationManager.alarmViewModels) { $alarm in
                    AlarmRowButtonView($alarm) {
                        alarmListVM.currentAlarm = alarm
                        alarmListVM.isActive.toggle()
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle(LocalizedStringKey("Alarm List"))
            .sheet(isPresented: $alarmListVM.isActive) {
                ChooseAddEditAlarmView(alarmModel: alarmListVM.currentAlarm)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        alarmListVM.addAction()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            localNotificationManager.removeAlarm(
                localNotificationManager.alarmViewModels[index]
            )
        }
    }
}

#Preview {
    AlarmListView()
        .environment(LocalNotificationManager())
}
