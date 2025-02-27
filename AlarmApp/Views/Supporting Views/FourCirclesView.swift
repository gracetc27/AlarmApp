//
//  FourCirclesView.swift
//  AlarmApp
//
//  Created by Grace couch on 27/02/2025.
//

import SwiftUI

struct FourCirclesView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var color1 = darkYellow
    var color2 = lightYellow
    @State private var offsetX: [CGFloat] = [0,0,0,0]
    @State private var offsetY: [CGFloat] = [0,0,0,0]
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            CircleView(radius: screenWidth / 10,
                       color1: color1,
                       color2: color2.opacity(0.3))
            .offset(x: screenWidth/4, y: -screenHeight/4)
            .offset(x: offsetX[0], y: offsetY[0])

            CircleView(radius: screenWidth / 7,
                       color1: color1,
                       color2: color2.opacity(0.3))
            .offset(x: -screenWidth/4, y: -screenHeight/20)
            .offset(x: offsetX[1], y: offsetY[1])

            CircleView(radius: screenWidth / 6,
                       color1: color1,
                       color2: color2.opacity(0.3))
            .offset(x: screenWidth/3, y: screenHeight/20)
            .offset(x: offsetX[2], y: offsetY[2])

            CircleView(radius: screenWidth / 5,
                       color1: color1,
                       color2: color2.opacity(0.3))
            .offset(x: -screenWidth/3, y: screenHeight/4)
            .offset(x: offsetX[3], y: offsetY[3])
        }
        .onReceive(timer) { _ in
            withAnimation(.easeIn(duration: 20)) {
                for i in 0..<offsetX.count {
                    offsetX[i] = Double.random(in: -300...300)
                }
                for i in 0..<offsetY.count {
                    offsetY[i] = Double.random(in: -300...300)
                }
            }
        }
    }
}

#Preview {
    FourCirclesView()
}
