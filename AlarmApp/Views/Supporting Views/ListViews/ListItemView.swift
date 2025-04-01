//
//  ListItemView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct ListItemView: View {
    @Environment(LocalNotificationManager.self) var localNotificationManager
    let alarmModel: Alarm
    var body: some View {
        HStack {
            Image(systemName: alarmModel.activitySFSymbol)
                .foregroundStyle(alarmModel.activityColor)
                .font(.title)

            Text("\(alarmModel.title) \(getTimeFromDate(date: alarmModel.endDate))")
                .font(.title3)
                .fontWeight(alarmModel.alarmEnabled ? .bold : .thin)
                .opacity(alarmModel.alarmEnabled ? 1 : 0.7)
                .fixedSize(horizontal: true, vertical: false)
        }
        .onChange(of: alarmModel.alarmEnabled) { _, alarmEnabled in
            if alarmEnabled {
                Task {
                    await localNotificationManager.schedule(localNotification: alarmModel)
                }
            } else {
                localNotificationManager.removeRequest(id: alarmModel.id)
            }
        }
    }
}

#Preview {
    ListItemView(alarmModel: .DefaultAlarm())
        .environment(LocalNotificationManager())
}
