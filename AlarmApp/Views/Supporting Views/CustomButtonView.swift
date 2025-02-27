//
//  CustomButtonView.swift
//  AlarmApp
//
//  Created by Grace couch on 27/02/2025.
//

import SwiftUI

struct CustomButtonView: View {
    var text: LocalizedStringKey
    var scaleX = 3.0
    var endRadius = 40.0
    let action: () -> Void
    var body: some View {
        Text(text)
            .foregroundStyle(black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(MainGradient(endRadius: endRadius, scaleX: scaleX))
            .cornerRadius(30)
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    CustomButtonView(text: "enable") {
    }
}
