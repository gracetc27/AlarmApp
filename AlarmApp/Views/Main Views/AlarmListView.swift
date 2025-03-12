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

    var modelsAndIndicies: [(model: Alarm, index: Int)] {
        Array(zip(localNotificationManager.alarmViewModels, localNotificationManager.alarmViewModels.indices))
    }
    var body: some View {
        NavigationStack {
            List {
                ForEach(modelsAndIndicies, id: \.model.id) { (model, index) in
                    Button {
                        currentIndex = index
                        isActive.toggle()
                    } label: {
                        ListItemView(alarmModel: model, index: index)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle(LocalizedStringKey("Alarm List"))
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
            // remove request
            print("remove \(localNotificationManager.alarmViewModels[index].id)")
        }
    }
}

#Preview {
    AlarmListView()
        .environment(LocalNotificationManager())
}
