//
//  SoundManager.swift
//  Feel Hangeul
//
//  Created by Joy on 2023/07/08.
//

import SwiftUI
import AVKit

final class SoundManager: ObservableObject {
    static let shared = SoundManager()
    var normalPlayer: AVAudioPlayer?
    var backgroundPlayer: AVAudioPlayer?
    let speedControl = AVAudioUnitVarispeed()
    
    func playSound(formusicName musicName: String) {
        guard let url = Bundle.main.url(forResource: musicName, withExtension: ".wav") else { return }
        do {
            normalPlayer?.enableRate = true
            normalPlayer = try AVAudioPlayer(contentsOf: url)
            normalPlayer?.rate = 2.0
            normalPlayer?.play()
        } catch let error {
             print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
    
    func stop() {
        normalPlayer = nil
    }
    
    func stopBackgroundMusic() {
        backgroundPlayer = nil
    }

}

