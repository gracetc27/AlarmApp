//
//  GrayTextView.swift
//  AlarmApp
//
//  Created by Grace couch on 26/02/2025.
//

import SwiftUI

struct GrayTextView: View {
    let text: LocalizedStringKey
    var font = Font.headline
    var body: some View {
        Text(text)
            .font(font)
            .foregroundStyle(.gray)
    }
}

#Preview {
    GrayTextView(text: "The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky.")
}
