//
//  MusicPlayer.swift
//  GundamMobile
//
//  Created by YiChao Qin on 12/1/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    
    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "IntotheSky", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                print("PLayed")
            } catch {
                print(error)
            }
        }
    }
    
    func changeVolume(volume: Float){
        audioPlayer?.volume = volume
    }
    
    func stopMusic(){
        audioPlayer?.stop()
    }
}
