//
//  SoundPicker.swift
//  AlarmApp
//
//  Created by Grace couch on 11/03/2025.
//

import SwiftUI

struct SoundPicker: View {
    @Binding var alarmSound: SoundConstants
    var body: some View {
        Picker("Sound", selection: $alarmSound) {
            ForEach(soundsList, id: \.self) { sound in
                Text(sound.rawValue.formatSoundName)
            }
        }
        .onChange(of: alarmSound, initial: false) { oldValue, newValue in
            Task {
                playSound(name: newValue.rawValue)
                try? await Task.sleep(for: .seconds(7))
                stopSound()
            }
        }
    }
}

#Preview {
    @Previewable @State var alarm = Alarm.DefaultAlarm().sounds
    SoundPicker(alarmSound: $alarm)
}
