//
//  CancelSaveButtonView.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct CancelSaveButtonView: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: Alarm
    var body: some View {
        HStack {
            Button("Cancel", role: .destructive) {
                print("cancel")
                // TODO implement
            }

            Spacer()

            Button(currentAlarmIndex == nil ? "Add" : "Save") {
                if let currentAlarmIndex = currentAlarmIndex {
                    print("save")
                    // TODO implement
                } else {
                    print("add")
                    // TODO implement
                }
            }
        }
        .padding()
    }
}

#Preview {
    CancelSaveButtonView(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
}
