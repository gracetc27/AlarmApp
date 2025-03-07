//
//  TimeArcView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct TimeArcView: View {
    let percentDifference: CGFloat
    let strokeStyle: StrokeStyle
    let color: Color
    let rotationOffset: CGFloat
    let size: CGFloat
    var body: some View {
        Circle()
            .trim(from: 0, to: percentDifference)
            .stroke(style: strokeStyle)
            .foregroundStyle(color)
            .frame(width: size, height: size)
            .rotationEffect(.degrees(-90 + rotationOffset))
    }
}

#Preview {
    TimeArcView(percentDifference: 0.5, strokeStyle: StrokeStyle(lineWidth: 20, dash: [1, 2]), color: .red, rotationOffset: 30, size: 200)
}
