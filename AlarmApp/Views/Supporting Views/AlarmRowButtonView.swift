//
//  AlarmRowButtonView.swift
//  AlarmApp
//
//  Created by Grace couch on 24/03/2025.
//

import SwiftUI

struct AlarmRowButtonView: View {
    @Environment(LocalNotificationManager.self) var localNotificationManager
    let index: Int
    @Binding var currentIndex: Int?
    @Binding var isActive: Bool
    var body: some View {
        @Bindable var localNotificationManager = localNotificationManager
        HStack {
            Button {
                currentIndex = index
                isActive.toggle()
            } label: {
                ListItemView(alarmModel: localNotificationManager.alarmViewModels[index], index: index)
            }
            Spacer()
            if index < localNotificationManager.alarmViewModels.count {
                AlarmToggleView(isOn: $localNotificationManager.alarmViewModels[index].alarmEnabled)
                    .labelsHidden()
            }
        }
    }
}

#Preview {
    AlarmRowButtonView(index: 0, currentIndex: .constant(0), isActive: .constant(false))
        .environment(LocalNotificationManager())
}
