//
//  SelectActivityView.swift
//  AlarmApp
//
//  Created by Grace couch on 06/03/2025.
//

import SwiftUI

struct SelectActivityView: View {
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String

    var currentColor: Color {
        mainColors[currentColorIndex]
    }
    var nextIndex: Int {
        (currentColorIndex + 1) % mainColors.count
    }
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(activities, id: \.self) { activity in
                        let isSelected = activity == currentActivity
                        Image(systemName: activity)
                            .font(isSelected ? .title : .subheadline)
                            .foregroundStyle(isSelected ? currentColor : nickel)
                            .opacity(isSelected ? 1 : 0.7)
                            .onTapGesture {
                                withAnimation {
                                    currentActivity = activity
                                }
                            }
                    }
                }
            }
            Circle()
                .fill(currentColor)
                .frame(width: 20, height: 20)
                .onTapGesture {
                    currentColorIndex = nextIndex
                }
        }
    }
}

#Preview {
    SelectActivityView(currentColorIndex: .constant(3), currentActivity: .constant("dumbbell.fill"))
}
