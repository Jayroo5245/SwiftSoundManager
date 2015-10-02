//
//  SwiftSoundManagerDefaults.swift
//  SwiftSoundManager
//
//  Created by Adam Bailey on 12/28/14.
//  Copyright (c) 2014 FourthFrame. All rights reserved.
//

import UIKit

private let _SwiftSoundManagerDefaultsSharedInstance = SwiftSoundManagerDefaults()

class SwiftSoundManagerDefaults: NSObject {
    
    private struct Defaults {
        static let alertChosen = "alertChosen"
    }
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var alertChosen: String {
        set(newValue) {
            self.defaults .setValue(newValue, forKey: Defaults.alertChosen)
        }
        get {
            return self.defaults .stringForKey(Defaults.alertChosen)!
        }
    }
    
    class var sharedInstance: SwiftSoundManagerDefaults {
        return _SwiftSoundManagerDefaultsSharedInstance
    }
    func registerDefaults() {
        let defaultOptions: [String: AnyObject] = [Defaults.alertChosen: ""]
        defaults.registerDefaults(defaultOptions)
    }

}
