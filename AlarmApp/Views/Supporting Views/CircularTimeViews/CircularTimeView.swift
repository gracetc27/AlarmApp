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

    init(alarmModel: Alarm, currentAlarmIndex: Int? = nil, size: CGFloat) {
        self.currentAlarmIndex = currentAlarmIndex
        self._alarmModel = State(initialValue: alarmModel)
        self.size = size
    }
    var body: some View {
        Circle()
            .stroke(lineWidth: 20)
            .frame(width: size)
            .overlay {
                Text("CircularTimeView")
            }
    }
}

#Preview {
    CircularTimeView(alarmModel: .DefaultAlarm(), size: screenWidth / 2)
}
