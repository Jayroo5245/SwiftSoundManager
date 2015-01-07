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
    
    override init() {
        super.init()
    }
    
    class var sharedInstance: SwiftSoundManagerDefaults {
        return _SwiftSoundManagerDefaultsSharedInstance
    }
//    func registerDefaults() {
//        let defaultOptions: [NSObject: AnyObject] = [Defaults.alertChosen: "ding-a-ling"]
//        defaults.registerDefaults(defaultOptions)
//    }

}