//
//  CentralDatePickerView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct CentralDatePickerView: View {
    let size: CGFloat
    @Binding var alarmModel: Alarm

    var lineWidth: CGFloat = 10.0

    var startTime: Date {
        alarmModel.startDate
    }
    var endtime: Date {
        alarmModel.endDate
    }
    var percentDifference: CGFloat {
        let value = dateToPercent(date: endtime) - dateToPercent(date: startTime)
        return value >= 0 ? value : 1 + value
    }
    var startToPercent: CGFloat {
        dateToPercent(date: startTime)
    }
    var endToPercent: CGFloat {
        startToPercent + percentDifference
    }
    var rotationOffset: CGFloat {
        360 * startToPercent
    }

    var body: some View {
        Circle()
            .stroke(lightGray, lineWidth: lineWidth)
            .frame(width: size)
            .overlay {
                VStack {
                    VStack {
                        GrayTextView(text: "start", font: .caption)
                        AlarmTimePicker(time: $alarmModel.startDate, scale: 1)
                    }
                    GrayTextView(text: "Set the alarm")
                    VStack {
                        AlarmTimePicker(time: $alarmModel.endDate, scale: 1)
                        GrayTextView(text: "end", font: .caption)
                    }
                }
            }
    }
}

#Preview {
    CentralDatePickerView(size: screenWidth / 2, alarmModel: .constant(.DefaultAlarm()))
}
