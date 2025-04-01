//
//  AlarmRowButtonView.swift
//  AlarmApp
//
//  Created by Grace couch on 24/03/2025.
//

import SwiftUI

struct AlarmRowButtonView: View {

    @Binding private var alarm: Alarm
    private let action: () -> Void

    init(_ alarm: Binding<Alarm>, action: @escaping () -> Void) {
        self._alarm = alarm
        self.action = action
    }

    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                ListItemView(alarmModel: alarm)
            }
            Spacer()

            AlarmToggleView(isOn: $alarm.alarmEnabled)
                    .labelsHidden()
        }
    }
}

#Preview {
    AlarmRowButtonView(.constant(.DefaultAlarm())) {}
        .environment(LocalNotificationManager())
}
