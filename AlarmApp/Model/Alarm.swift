//
//  Alarm.swift
//  AlarmApp
//
//  Created by Grace couch on 26/02/2025.
//

import SwiftUI

struct Alarm: Identifiable, Hashable {
    let id = UUID().uuidString
    let title: String
    let body: String
    let repeats: Bool

    var alarmEnabled: Bool
    var sounds: SoundConstants
    var startDate: Date
    var endDate: Date
    var activitySFSymbol: String
    var colorIndex: Int
    var activityColor: Color {
        mainColors[colorIndex]
    }
    var timeInterval: TimeInterval {
        endDate - startDate
    }
    var startTime: Time {
        dateToTimeModel(date: startDate)
    }
    var endTime: Time {
        dateToTimeModel(date: endDate)
    }

    static func DefaultAlarm() -> Alarm {
        Alarm(title: "Climbing Session",
              body: "Time to climb!",
              repeats: false,
              alarmEnabled: true,
              sounds: .lagrima,
              startDate: .now,
              endDate: addTimeToDate(date: .now, hours: 12, minutes: 0),
              activitySFSymbol: "dumbbell.fill",
              colorIndex: 0)
    }
    static func DummyAlarmData() -> [Alarm] {
        [
            Alarm(title: "Climbing Session",
               body: "Time to climb!",
                  repeats: false,
                  alarmEnabled: true,
               sounds: .lagrima,
               startDate: .now,
               endDate: .distantFuture,
               activitySFSymbol: "dumbbell.fill",
               colorIndex: 3),
            Alarm(title: "Coding",
                  body: "Time to programme!",
                  repeats: false,
                  alarmEnabled: false,
                  sounds: .lagrima,
                  startDate: .now,
                  endDate: .distantFuture,
                  activitySFSymbol: "laptopcomputer",
                  colorIndex: 2),
            Alarm(title: "Work",
                  body: "Time to serve!",
                  repeats: false,
                  alarmEnabled: true,
                  sounds: .lagrima,
                  startDate: .now,
                  endDate: .distantFuture,
                  activitySFSymbol: "folder.circle.fill",
                  colorIndex: 0)
        ]
            .sorted {
                $0.endTime < $1.endTime
            }
    }

}

