//
//  AlarmListView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct AlarmListView: View {
    var alarmModels: [Alarm]

    var modelsAndIndicies: [(model: Alarm, index: Int)] {
        Array(zip(alarmModels, alarmModels.indices))
    }
    var body: some View {
        NavigationStack {
            List {
                ForEach(modelsAndIndicies, id: \.model.id) { (model, index) in
                    NavigationLink {
                        MainAddEditView(currentAlarmIndex: index, alarmModel: model)
                    } label: {
                        ListItemView(model: model, index: index)
                    }
                }
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
}

#Preview {
    AlarmListView(alarmModels: Alarm.DummyAlarmData())
}
