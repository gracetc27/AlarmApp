//
//  TimeOfDayIcon.swift
//  AlarmApp
//
//  Created by Grace couch on 26/02/2025.
//

import SwiftUI

struct TimeOfDayIcon: View {
    let date: Date
    var percent: CGFloat {
       dateToPercent(date: date)
    }
    var hour: Int {
        Int(24 * percent)
    }
    var image: (name: String, color: Color) {
        switch hour {
        case 6..<8:
            return ("sun.and.horizon.fill", .orange)
        case 8..<17:
            return ("sun.max.fill", .yellow)
        case 17..<21:
            return ("sun.and.horizon.fill", .pink)
        case 21..<24:
            return ("moon.fill", .black)
        default:
            return ("moon.stars.fill", .black)
        }
    }
    var body: some View {
        Image(systemName: image.name)
            .foregroundStyle(image.color)
    }
}

#Preview {
    TimeOfDayIcon(date: .now)
}
