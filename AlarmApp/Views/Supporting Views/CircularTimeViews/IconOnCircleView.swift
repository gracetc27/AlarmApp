//
//  IconOnCircleView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct IconOnCircleView: View {
    let date: Date
    let size: CGFloat
    let percent: CGFloat

    var circleDiameter = 40.0
    var body: some View {
        Circle()
            .frame(width: circleDiameter, height: circleDiameter)
            .foregroundStyle(cardBackgroundColor)
            .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 1)
            .overlay {
                TimeOfDayIcon(date: date)
            }
            .rotation3DEffect(.degrees(-percent * 360), axis: (x: 0, y: 0, z: 1))
            .offset(y: -size / 2)
            .rotation3DEffect(.degrees(percent * 360), axis: (x: 0, y: 0, z: 1))
    }
}

#Preview {
    IconOnCircleView(date: .now, size: 200, percent: 0.5)
}
