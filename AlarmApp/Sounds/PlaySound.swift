//
//  PlaySound.swift
//  AlarmApp
//
//  Created by Grace couch on 11/03/2025.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer? = AVAudioPlayer()

func playSound(name: String, type: String, volume: Float = 1.0) {
    if let path = Bundle.main.path(forResource: name, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.setVolume(volume, fadeDuration: 0.1)
            audioPlayer?.play()
        } catch let error {
            print(error)
        }
    }
}

func stopSound() {
    audioPlayer?.stop()
}


