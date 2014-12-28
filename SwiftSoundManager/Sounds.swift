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
        var audioId: SystemSoundID
    }
    
    override init() {
        super.init()
        sounds = constructSounds()
    }
    
    private func constructSounds() -> [Sound] {
        sounds.append(Sound(name: "Ding-a-ling", audioId: 1008))
        sounds.append(Sound(name: "Bells", audioId: 1009))
        sounds.append(Sound(name: "Ding", audioId: 1013))
        sounds.append(Sound(name: "Low Ting", audioId: 1052))
        sounds.append(Sound(name: "Low Beep", audioId: 1070))
        sounds.append(Sound(name: "Wine Glass", audioId: 1054))
        sounds.append(Sound(name: "Double Beep", audioId: 1255))
        
        // Modified http://www.freesound.org/people/Benboncan/sounds/66951/
        let boxingBellSoundURL = NSBundle.mainBundle().URLForResource("boxing-bell", withExtension: "wav")
        var boxingBell: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(boxingBellSoundURL, &boxingBell)
        sounds.append(Sound(name: "Boxing Bell", audioId: boxingBell))
        
        return sounds
    }
    
    func playSystemSound(audioID: SystemSoundID) {
        AudioServicesPlaySystemSound(audioID)
    }
    
    func playSystemSound(sound: Sound) {
        playSystemSound(sound.audioId)
    }
   
}
