//
//  Sounds.swift
//  SwiftSoundManager
//
//  Created by Adam Bailey on 12/28/14.
//  Copyright (c) 2014 Adam Bailey. All rights reserved.
//

import UIKit
import AudioToolbox

class Sounds: NSObject {
    
    var sounds: [Sound] = [Sound]()
    
    struct Sound {
        var name: String
        var audioID: SystemSoundID
    }
    
    override init() {
        super.init()
        sounds = constructSounds()
    }
    
    private func constructSounds() -> [Sound] {
        sounds.append(Sound(name: "Ding-a-ling", audioID: 1008))
        sounds.append(Sound(name: "Bells", audioID: 1009))
        sounds.append(Sound(name: "Ding", audioID: 1013))
        sounds.append(Sound(name: "Low Ting", audioID: 1052))
        sounds.append(Sound(name: "Low Beep", audioID: 1070))
        sounds.append(Sound(name: "Wine Glass", audioID: 1054))
        sounds.append(Sound(name: "Double Beep", audioID: 1255))
        
        // Modified http://www.freesound.org/people/Benboncan/sounds/66951/
        let boxingBellSoundURL = NSBundle.mainBundle().URLForResource("boxing-bell", withExtension: "wav")
        var boxingBell: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(boxingBellSoundURL, &boxingBell)
        sounds.append(Sound(name: "Boxing Bell", audioID: boxingBell))
        
        // Modified http://www.freesound.org/people/the_very_Real_Horst/sounds/193040/
        let taoChiGongSoundURL = NSBundle.mainBundle().URLForResource("tao-chi-gong", withExtension: "wav")
        var taoChiGong: SystemSoundID = 1
        AudioServicesCreateSystemSoundID(taoChiGongSoundURL, &taoChiGong)
        sounds.append(Sound(name: "Tao Chi Gong", audioID: taoChiGong))
        
        return sounds
    }
    
    func playSystemSound(audioID: SystemSoundID) {
        AudioServicesPlaySystemSound(audioID)
    }
    
    func playSystemSound(sound: Sound) {
        playSystemSound(sound.audioID)
    }
   
}
