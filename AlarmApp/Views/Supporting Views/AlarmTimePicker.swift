//
//  AlarmTimePicker.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct AlarmTimePicker: View {
    @Binding var time: Date
    var scale: Double = 1.0
    var body: some View {
        DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
            .scaleEffect(scale)
            .labelsHidden()
    }
}

#Preview {
    AlarmTimePicker(time: .constant(Date()))
}
