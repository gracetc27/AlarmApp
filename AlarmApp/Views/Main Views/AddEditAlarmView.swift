//
//  AddEditAlarmView.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @State private var alarmModel: Alarm
    @State private var showYouDidItView = true

    init(alarmModel: Alarm, currentAlarmIndex: Int? = nil) {
        self.currentAlarmIndex = currentAlarmIndex
        self._alarmModel = State(initialValue: alarmModel)
    }
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
                ToBedWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
                    .padding(.horizontal)
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
    AddEditAlarmView(alarmModel: .DefaultAlarm())
}
