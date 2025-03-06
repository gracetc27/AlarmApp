//
//  AlarmToggleView.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct AlarmToggleView: View {
    @Binding var isOn: Bool

    var body: some View {
        HStack {
            GrayTextView(text: "alarm")
            Spacer()
            Toggle(LocalizedStringKey(isOn ? "on" : "off"), isOn: $isOn)
        }
    }
}

#Preview {
    VStack {
        AlarmToggleView(isOn: .constant(true))
        AlarmToggleView(isOn: .constant(false))
    }
}
