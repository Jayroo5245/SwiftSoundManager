//
//  Sounds.swift
//  SwiftSoundManager
//
//  Created by Adam Bailey on 12/28/14.
//  Copyright (c) 2014 Adam Bailey. All rights reserved.
//

import UIKit
import AudioToolbox

class SoundManager: NSObject {
    
    var sounds: [Sound]?
    
    struct Sound {
        let displayName: String
        let soundName: String
        let audioID: SystemSoundID
    }
    
    override init() {
        sounds = [Sound]()
        super.init()
        sounds = constructSounds()
    }
    
    private func constructSounds() -> [Sound] {
        var mutableSounds: [Sound] = [Sound]()
        
        mutableSounds.append(Sound(displayName: "Ding-a-ling", soundName: "ding-a-ling", audioID: 1008))
        mutableSounds.append(Sound(displayName: "Bells", soundName: "bells", audioID: 1009))
        mutableSounds.append(Sound(displayName: "Ding", soundName: "ding", audioID: 1013))
        mutableSounds.append(Sound(displayName: "Low Ting", soundName: "low-ting", audioID: 1052))
        mutableSounds.append(Sound(displayName: "Wine Glass", soundName: "wine-glass", audioID: 1054))
        mutableSounds.append(Sound(displayName: "Low Beep", soundName: "low-beep", audioID: 1070))
        mutableSounds.append(Sound(displayName: "Double Beep", soundName: "double-beep", audioID: 1255))
        
        // Modified http://www.freesound.org/people/Benboncan/sounds/66951/
        let boxingBellSoundURL = NSBundle.mainBundle().URLForResource("boxing-bell", withExtension: "wav")
        var boxingBell: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(boxingBellSoundURL!, &boxingBell)
        mutableSounds.append(Sound(displayName: "Boxing Bell", soundName: "Boxing Bell", audioID: boxingBell))
        
        // Modified http://www.freesound.org/people/the_very_Real_Horst/sounds/193040/
        let taoChiGongSoundURL = NSBundle.mainBundle().URLForResource("tao-chi-gong", withExtension: "wav")
        var taoChiGong: SystemSoundID = 1
        AudioServicesCreateSystemSoundID(taoChiGongSoundURL!, &taoChiGong)
        mutableSounds.append(Sound(displayName: "Tao Chi Gong", soundName: "Tao Chi Gong", audioID: taoChiGong))
        
        return mutableSounds
    }
    
    func playSystemSound(audioID: SystemSoundID) {
        AudioServicesPlaySystemSound(audioID)
    }
    
    func playSystemSound(sound: Sound) {
        playSystemSound(sound.audioID)
    }
    
    func rowForSoundName(soundName: String) -> Int {
        for index in 0...sounds!.count-1 {
            if sounds![index].soundName == soundName {
                return index
            }
        }
        return -1
    }
   
}
