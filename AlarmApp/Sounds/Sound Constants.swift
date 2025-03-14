//
//  Sound Constants.swift
//  AlarmApp
//
//  Created by Grace couch on 26/02/2025.
//

import Foundation

enum SoundConstants: String, CaseIterable, Codable {
    case wake_up = "Sound Wake up.aiff"
    case lagrima = "Lagrima.aiff"
}

let soundsList: [SoundConstants] = [
    .lagrima,
    .wake_up,
]

extension String {
    var formatSoundName: String {
        var result = String(describing: self)
            .replacingOccurrences(of: "_", with: " ")
            .capitalized
        let periodIndex = result.firstIndex(of: ".")

        if let periodIndex = periodIndex {
           result.removeSubrange(periodIndex...)
        }
        return result
    }
}

