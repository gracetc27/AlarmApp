//
//  SplashScreenView.swift
//  AlarmApp
//
//  Created by Grace couch on 27/02/2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var opacity = 0.7
    @State private var fontSize = 12.0
    let font = "WorkSans-VariableFont_wght"

    var body: some View {
        if isActive {
            MainAlarmView()
        } else {
            ZStack {
                FourCirclesView()
                VStack {
                    VStack(spacing: 10) {
                        Text(LocalizedStringKey("hello there!"))
                        Text(LocalizedStringKey("let's add an alarm"))
                    }
                    .font(.custom(font, size: fontSize))
                    .multilineTextAlignment(.center)
                    .padding()
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            opacity = 1.0
                            fontSize = 36.0
                        }
                    }
                    Spacer()
                    Image(clock)
                        .resizable()
                        .scaledToFit()
                    FourCirclesView()

                    Button("Lets get started...", systemImage: "alarm.fill") {
                        withAnimation {
                            isActive = true
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
