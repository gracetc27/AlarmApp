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

    var body: some View {
        NavigationStack {
            List {
                ForEach(localNotificationManager.alarmViewModels.indices, id: \.self) { index in
                    Button {
                        currentIndex = index
                        isActive.toggle()
                    } label: {
                        ListItemView(alarmModel: localNotificationManager.alarmViewModels[index], index: index)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle(LocalizedStringKey("Alarm List"))
            .sheet(isPresented: $isActive) {
                AddEditAlarmView(currentAlarmIndex: currentIndex)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        MainAddEditView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
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
