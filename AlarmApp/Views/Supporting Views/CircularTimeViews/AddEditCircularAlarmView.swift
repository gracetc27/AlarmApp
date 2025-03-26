//
//  AddEditCircularAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct AddEditCircularAlarmView: View {
    @Binding private var alarmModel: Alarm

    init(alarmModel: Binding<Alarm>) {
        self._alarmModel = alarmModel
    }

    var body: some View {
        ScrollView {
            VStack {
                EditTitleBodyView(title: $alarmModel.title, description: $alarmModel.description)
                Divider()
                Spacer()
                CircularTimeView(alarmModel: $alarmModel, size: screenWidth / 2)
                    .padding(.vertical)
                HStack {
                    GrayTextView(text: "Sound")
                    Spacer()
                    SoundPicker(alarmSound: $alarmModel.sounds)
                }
                .padding()
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
}

#Preview {
    AddEditCircularAlarmView(alarmModel: .constant(.DefaultAlarm()))
}
