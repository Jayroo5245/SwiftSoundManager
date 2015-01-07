//
//  UIColor+SwiftSoundManager.swift
//  SwiftSoundManager
//
//  Created by Adam Bailey on 1/7/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

import UIKit

extension UIColor {
    
    func mainBackgroundColor() -> UIColor {
        return UIColor(white:0.204, alpha:1.0)
    }
    
    func primaryTextColor() -> UIColor {
        return UIColor(white:0.8, alpha:1.0)
    }
    
    func primaryTintColor() -> UIColor {
        return primaryTextColor()
    }
        
    func tableCellBackgroundColor() -> UIColor {
        return UIColor(white:0.26, alpha:1.0)
    }
    
    func secondaryBorderColor() -> UIColor {
        return UIColor(white:0.4, alpha:1.0)
    }
}
