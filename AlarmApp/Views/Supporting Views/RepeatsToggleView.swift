//
//  RepeatsToggleView.swift
//  AlarmApp
//
//  Created by Grace couch on 14/03/2025.
//

import SwiftUI

struct RepeatsToggleView: View {
    @Binding var doesRepeat: Bool

    var body: some View {
        HStack {
            Spacer()
            Toggle(LocalizedStringKey(doesRepeat ? "repeats on" : "repeats off"), isOn: $doesRepeat)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    RepeatsToggleView(doesRepeat: .constant(true))
}
