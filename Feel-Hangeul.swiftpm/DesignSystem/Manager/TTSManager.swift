//
//  File.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import AVKit

final class TTSManager {
    static let shared = AVSpeechSynthesizer()
    
    /// - Returns: AVSpeechUtterance
    static func getAVSpeechUtterance(string: String) -> AVSpeechUtterance {
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.5
        return utterance
    }
    
    static func stop() {
        let utterance = AVSpeechUtterance(string: "")
        shared.speak(utterance)
        shared.stopSpeaking(at: .immediate)
    }
}

