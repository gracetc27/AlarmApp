//
//  CircleView.swift
//  AlarmApp
//
//  Created by Grace couch on 27/02/2025.
//

import SwiftUI

struct CircleView: View {
    let radius: CGFloat
    var color1 = yellow
    var color2 = Color.clear
    var body: some View {
        Circle()
            .fill(LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottom))
            .frame(width: radius, height: radius)
    }
}

#Preview {
    CircleView(radius: 40.0)
}
