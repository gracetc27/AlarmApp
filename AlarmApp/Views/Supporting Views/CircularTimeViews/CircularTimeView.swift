//
//  CircularTimeView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct CircularTimeView: View {
    let currentAlarmIndex: Int?
    @State private var alarmModel: Alarm

    let size: CGFloat

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

    init(alarmModel: Alarm, currentAlarmIndex: Int? = nil, size: CGFloat) {
        self.currentAlarmIndex = currentAlarmIndex
        self._alarmModel = State(initialValue: alarmModel)
        self.size = size
    }

    var body: some View {
        ZStack {
            CentralDatePickerView(size: size, alarmModel: $alarmModel)
            TimeArcView(percentDifference: percentDifference, strokeStyle: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round), color: .black, rotationOffset: rotationOffset, size: size)
            TimeArcView(percentDifference: percentDifference, strokeStyle: StrokeStyle(lineWidth: 15, dash: [1, 2]), color: .gray, rotationOffset: rotationOffset, size: size)
            IconOnCircleView(date: startTime, size: size, percent: startToPercent)
            IconOnCircleView(date: endtime, size: size, percent: endToPercent)
        }
    }
}

#Preview {
    CircularTimeView(alarmModel: .DefaultAlarm(), size: screenWidth / 2)
}
