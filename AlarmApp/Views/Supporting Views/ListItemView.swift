//
//  ListItemView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct ListItemView: View {
    let model: Alarm
    let index: Int
    var body: some View {
        HStack {
            Image(systemName: model.activitySFSymbol)
                .foregroundStyle(model.activityColor)
                .font(.title)

            Text("\(getTimeFromDate(date: model.endDate))")
                .font(.title)
                .fontWeight(model.alarmEnabled ? .bold : .thin)
                .opacity(model.alarmEnabled ? 1 : 0.7)
            Spacer()
           // GrayTextView(text: LocalizedStringKey(model.title)) 
            AlarmToggleView(isOn: .constant(Alarm.DummyAlarmData()[index].alarmEnabled))
                .labelsHidden()

            


        }
    }
}

#Preview {
    ListItemView(model: .DefaultAlarm(), index: 0)
}
