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
    case christmas_bells = "christmas_bells.mp3"
    case mr_grinch_ravens = "mr_grinch_ravens.mp3"
    case my_baby = "my_baby.mp3"
    case peanuts_ringtone = "peanuts_ringtone.mp3"
    case tennessee_whiskey = "tennessee_whiskey.mp3"
    case turkey_time = "turkey_time.mp3"
    case wasted_on_u = "wasted_on_u.mp3"
    case welcome_to_my_house = "welcome_to_my_house.mp3"
    case bird_forest = "bird forest.mp3"
    case bird_voices = "bird voices.mp3"
    case forest_birds_sweden = "forest birds sweden.mp3"
    case forest_with_cuckoo_birds = "forest with cuckoo birds.mp3"
    case night_ambience = "night ambience.mp3"
    case owl_hooting = "owl hooting.mp3"
    case screeching_owl = "screeching owl.mp3"
    case soft_rain_ambient = "soft rain ambient.mp3"
    case the_beat_of_nature = "the beat of nature.mp3"
    case waterfall = "waterfall.mp3"
}

let soundsList: [SoundConstants] = [
    .bird_forest,
    .bird_voices,
    .christmas_bells,
    .forest_birds_sweden,
    .forest_with_cuckoo_birds,
    .lagrima,
    .mr_grinch_ravens,
    .my_baby,
    .night_ambience,
    .owl_hooting,
    .peanuts_ringtone,
    .screeching_owl,
    .soft_rain_ambient,
    .tennessee_whiskey,
    .the_beat_of_nature,
    .turkey_time,
    .wake_up,
    .wasted_on_u,
    .waterfall,
    .welcome_to_my_house
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

