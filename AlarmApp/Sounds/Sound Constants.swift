//
//  Sound Constants.swift
//  AlarmApp
//
//  Created by Grace couch on 26/02/2025.
//

import Foundation

enum SoundConstants: String, CaseIterable {
    case wake_up = "Wake up"
    case lagrima = "Lagrima"

    static func formatSoundName() -> String {
        String(describing: self)
            .replacingOccurrences(of: "_", with: " ")
            .capitalized
    }

}
