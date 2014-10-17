//
//  UIButton.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-15.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import UIKit

public extension UIButton {
 
    public override func now(action: UIButton -> ()) -> UIButton {
        action(self)
        return self
    }
    
    public func clickOn(label:String = "", action: UIButton -> ()) -> UIButton {
        return self.__on(UIControlEvents.TouchUpInside, label: label) {
            action($0 as UIButton)
        } as UIButton
    }
    
    public func clickOff(label:String = "") -> UIButton {
        return self.__off(UIControlEvents.TouchUpInside, label: label) as UIButton
    }
}