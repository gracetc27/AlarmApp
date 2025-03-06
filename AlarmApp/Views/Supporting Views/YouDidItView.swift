//
//  YouDidItView.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct YouDidItView: View {
    var body: some View {
        ZStack {
            MainGradient(endRadius: 120, scaleX: 1.5)
            HStack {
                Image(youDidIt)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                Text(LocalizedStringKey("you did it! here you can manage your alarm, change time and other things"))
                    .padding(.horizontal)
                    .font(.title3.bold())
                    .multilineTextAlignment(.leading)
                    .frame(width: screenWidth / 1.5)
            }
        }
        .cornerRadius(20)
        .frame(height: screenHeight / 4)

    }
}

#Preview {
    YouDidItView()
}
