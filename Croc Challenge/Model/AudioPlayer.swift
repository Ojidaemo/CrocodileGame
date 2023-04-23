//
//  AudioPlayer.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-23.
//

import Foundation
import AVFoundation

struct AudioPlayer {
    
    var player: AVAudioPlayer!
    
    mutating func playSound(soundName: String) {
        
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
