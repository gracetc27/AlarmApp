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
            
            Divider()
            Spacer()
            CircularTimeView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel, size: screenWidth / 2)
                .padding(.vertical)
            Spacer()
            Divider()
            AlarmToggleView(isOn: $alarmModel.alarmEnabled)
                .padding()
            RepeatsToggleView(doesRepeat: $alarmModel.repeats)
                .padding()
            SelectActivityView(currentColorIndex: $alarmModel.colorIndex, currentActivity: $alarmModel.activitySFSymbol)
                .padding()
        }
    }
}

#Preview {
    AddEditCircularAlarmView(alarmModel: .DefaultAlarm())
        .environment(LocalNotificationManager())
}
