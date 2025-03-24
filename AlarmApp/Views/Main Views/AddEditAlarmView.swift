//
//  AddEditAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @State private var alarmModel: Alarm


    init(currentAlarmIndex: Int?, alarmModel: Alarm) {
        self.currentAlarmIndex = currentAlarmIndex
        self._alarmModel = State(initialValue: alarmModel)
    }

    var body: some View {
        ToBedWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel)
            .padding(.horizontal)
    }
}


#Preview {
    AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
        .environment(LocalNotificationManager())
}
