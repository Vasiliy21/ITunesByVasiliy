//
//  SoundManager.swift
//  ITunesByVasiliy
//
//  Created by Vasiliy on 30.05.2023.
//

import Foundation
import AVKit

class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?
    
    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}
