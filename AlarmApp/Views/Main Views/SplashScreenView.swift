//
//  SplashScreenView.swift
//  AlarmApp
//
//  Created by Grace couch on 27/02/2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var splashScreenVM = SplashScreenViewModel()

    var body: some View {
        if splashScreenVM.isActive {
            MainAlarmView()
        } else {
            ZStack {
                FourCirclesView()
                VStack {
                    VStack(spacing: 10) {
                        Text(LocalizedStringKey("hello there!"))
                        Text(LocalizedStringKey("let's add an alarm"))
                    }
                    .font(.custom(fontVariable, size: splashScreenVM.fontSize))
                    .multilineTextAlignment(.center)
                    .padding()
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            splashScreenVM.opacity = 1.0
                            splashScreenVM.fontSize = 36.0
                        }
                    }
                    Spacer()
                    Image(clock)
                        .resizable()
                        .scaledToFit()
                    
                    FourCirclesView()

                    Button("Lets get started...", systemImage: "alarm.fill") {
                        withAnimation {
                            splashScreenVM.isActive = true
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
        .environment(LocalNotificationManager())
}
