//
//  AboutView.swift
//  AlarmApp
//
//  Created by Grace couch on 27/02/2025.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            MainGradient(endRadius: screenHeight/2)
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 20) {
                    Text(LocalizedStringKey("About"))
                        .font(.largeTitle.bold())
                    Text(LocalizedStringKey("The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky."))
                        .font(.title)
                        .minimumScaleFactor(0.1)
                        .padding()
                    Spacer()

                    Image(samples)
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.8)
                    Spacer()

                    if let url = URL(string: "https://dribbble.com/antonleogky") {
                        Link(destination: url) {
                            CustomButtonView(text: "to Anton's page")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AboutView()
}
