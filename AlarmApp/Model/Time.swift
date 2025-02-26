//
//  Time.swift
//  AlarmApp
//
//  Created by Grace couch on 26/02/2025.
//

import Foundation

struct Time: Comparable, Equatable, Identifiable {
    let id = UUID()
    let hour: Int
    let minute: Int

    static func < (lhs: Time, rhs: Time) -> Bool {
        if lhs.hour < rhs.hour {
            return true
        } else if lhs.hour == rhs.hour && lhs.minute < rhs.minute {
            return true
        } else {
            return false
        }
    }
}
