//
//  AddEditAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?

    @State private var showYouDidItView = true
    @Environment(LocalNotificationManager.self) var localNotificationManager

    var body: some View {
        ZStack {
            backgroundColor
                .opacity(0.7)
                .ignoresSafeArea()
            VStack {
                if showYouDidItView {
                    YouDidItView()
                        .padding()
                }
                if let currentAlarmIndex = currentAlarmIndex {
                    ToBedWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: localNotificationManager.alarmViewModels[currentAlarmIndex])
                        .padding(.horizontal)
                } else {
                    ToBedWakeUpView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
                        .padding(.horizontal)
                }
            }
        }
        .onAppear {
            Task {
                try? await Task.sleep(for: .seconds(3.0))
                withAnimation(.easeOut(duration: 2.0)) {
                    showYouDidItView = false
                }
            }
        }
    }
}

#Preview {
    AddEditAlarmView(currentAlarmIndex: nil)
        .environment(LocalNotificationManager())
}
