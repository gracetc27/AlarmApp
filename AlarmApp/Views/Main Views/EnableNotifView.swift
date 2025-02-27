//
//  EnableNotifView.swift
//  AlarmApp
//
//  Created by Grace couch on 27/02/2025.
//

import SwiftUI

struct EnableNotifView: View {
    var body: some View {
        ZStack {
            FourCirclesView()
            VStack {
                Spacer()
                Text(LocalizedStringKey("Enable notifications, please"))
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()

                CustomButtonView(text: "enable") {

                }
                .font(.title2.bold())
                .padding()
            }
        }
    }
}

#Preview {
    EnableNotifView()
}
