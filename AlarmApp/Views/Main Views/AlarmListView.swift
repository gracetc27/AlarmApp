//
//  AlarmListView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct AlarmListView: View {
    @Environment(LocalNotificationManager.self) var localNotificationManager

    @State private var isActive = false
    @State private var currentIndex: Int? = nil
    @State private var alarmViewType: AlarmViewType = .circular

    var body: some View {
        NavigationStack {
            List {
                ForEach(localNotificationManager.alarmViewModels.indices, id: \.self) { index in
                    AlarmRowButtonView(index: index, currentIndex: $currentIndex, isActive: $isActive)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle(LocalizedStringKey("Alarm List"))
            .sheet(isPresented: $isActive) {
                ChooseAlarmView(alarmViewType: alarmViewType, currentAlarmIndex: $currentIndex)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        ChooseAlarmView(alarmViewType: alarmViewType, currentAlarmIndex: $currentIndex)
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
            localNotificationManager.removeRequest(id: localNotificationManager.alarmViewModels[index].id )
        }
    }
}

#Preview {
    AlarmListView()
        .environment(LocalNotificationManager())
}
