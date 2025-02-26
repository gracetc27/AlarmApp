//
//  TimeAndDateSupport.swift
//  AlarmApp
//
//  Created by Grace couch on 26/02/2025.
//

import Foundation

func dateToPercent(date: Date) -> CGFloat {
    let components = getTimeComponents(date: date)
    return CGFloat(components.hour) / 24 + CGFloat(components.minute) / (24 * 60)

}

func getTimeComponents(date: Date) -> (hour: Int, minute: Int, day: Int, month: Int, year: Int) {
    let components = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: date)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
    let day = components.day ?? 0
    let month = components.month ?? 0
    let year = components.year ?? 0
    return (hour: hour, minute: minute, day: day, month: month, year: year)
}

func getTimeFromDate(date: Date) -> String {
    date.formatted(.dateTime.hour(.twoDigits(amPM: .omitted)).minute(.twoDigits))
}

func addTimeToDate(date: Date, hours: Int, minutes: Int) -> Date {
    date.addingTimeInterval(
        TimeInterval(minutes * 60 + hours * 3600)
    )
}

func dateToTimeModel(date: Date) -> Time {
    let components = getTimeComponents(date: date)
    return Time(hour: components.hour, minute: components.minute)
}

extension Date {
    static func -(lhs: Date, rhs: Date) -> TimeInterval {
        lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate

    }
}


