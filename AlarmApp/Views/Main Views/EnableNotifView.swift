//
//  EnableNotifView.swift
//  AlarmApp
//
//  Created by Grace couch on 27/02/2025.
//

import SwiftUI

struct EnableNotifView: View {
    @Environment(LocalNotificationManager.self) var localNotificationManager
    var body: some View {
        ZStack {
            FourCirclesView()
            VStack {
                Spacer()
                Text(LocalizedStringKey("Enable notifications, please"))
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Button {
                    Task {
                        await localNotificationManager.openSettings()
                    }
                } label: {
                    CustomButtonView(text: "enable")
                }
                .padding()
            }
        }
    }
}

#Preview {
    EnableNotifView()
        .environment(LocalNotificationManager())
}
