//
//  AddEditCircularAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct AddEditCircularAlarmView: View {
    let currentAlarmIndex: Int?
    @State private var alarmModel: Alarm

    init(alarmModel: Alarm, currentAlarmIndex: Int? = nil) {
        self.currentAlarmIndex = currentAlarmIndex
        self._alarmModel = State(initialValue: alarmModel)
    }
    var body: some View {
        VStack {
            CancelSaveButtonView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
            AlarmToggleView(isOn: $alarmModel.alarmEnabled)
            Divider()
            Spacer()
            CircularTimeView(alarmModel: alarmModel, currentAlarmIndex: currentAlarmIndex, size: screenWidth / 2)
            Spacer()
        }
    }
}

#Preview {
    AddEditCircularAlarmView(alarmModel: .DefaultAlarm())
}
