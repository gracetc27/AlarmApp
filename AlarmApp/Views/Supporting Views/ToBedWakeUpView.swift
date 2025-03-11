//
//  ToBedWakeUpView.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct ToBedWakeUpView: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: Alarm

    var body: some View {
        VStack {
            CancelSaveButtonView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
            AlarmToggleView(isOn: $alarmModel.alarmEnabled)
                .padding()
            Divider()
            HStack {
                Grid {
                    GridRow {
                        TimeOfDayIcon(date: alarmModel.startDate)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            GrayTextView(text: "start")
                            AlarmTimePicker(time: $alarmModel.startDate, scale: 1.25)
                        }
                    }
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                        }
                    }
                    .padding(.vertical)
                    GridRow {
                        Image(systemName: alarmModel.activitySFSymbol)
                            .foregroundStyle(alarmModel.activityColor)
                        SelectActivityView(currentColorIndex: $alarmModel.colorIndex, currentActivity: $alarmModel.activitySFSymbol)
                            .padding(.horizontal)
                    }
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                        }
                    }
                    .padding(.vertical)
                    GridRow {
                        TimeOfDayIcon(date: alarmModel.endDate)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            AlarmTimePicker(time: $alarmModel.endDate, scale: 1.25)
                            GrayTextView(text: "end")
                        }
                    }
                    GridRow {
                        GrayTextView(text: "Sound")
                        VStack {
                            SoundPicker(alarmSound: $alarmModel.sounds)                        }
                        .padding(.vertical)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .background(cardBackgroundColor)
        .cornerRadius(20)
    }
}

#Preview {
    ToBedWakeUpView(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
}
