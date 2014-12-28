//
//  ViewController.swift
//  SwiftSoundManager
//
//  Created by Adam Bailey on 12/27/14.
//  Copyright (c) 2014 Adam Bailey. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UIPickerViewDelegate {
 
    var sound: Sounds = Sounds()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sound.sounds.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return sound.sounds[row].name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let audioID: SystemSoundID = sound.sounds[row].audioId
        sound.playSystemSound(audioID)
    }

}

