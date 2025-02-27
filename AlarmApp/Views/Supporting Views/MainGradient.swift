//
//  MainGradient.swift
//  AlarmApp
//
//  Created by Grace couch on 27/02/2025.
//

import SwiftUI

struct MainGradient: View {
    var startRadius = 0.0
    let endRadius: CGFloat
    var color = yellow
    var scaleX = 1.0
    var opacityRadGradient = 1.0
    var opacityLinGradient = 0.5
    var body: some View {
        ZStack {
            LinearGradient(colors: [blue, purple, pink], startPoint: .top, endPoint: .bottom)
                .opacity(opacityLinGradient)
            RadialGradient(colors: [color, .clear], center: .bottom, startRadius: startRadius, endRadius: endRadius)
                .opacity(opacityRadGradient)
                .scaleEffect(x: scaleX)
        }
    }
}

#Preview {
    MainGradient(endRadius: 200)

}
