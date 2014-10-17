//
//  UISlider.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-15.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import UIKit

extension UISlider {
    
    public override func now(action: UISlider -> ()) -> UISlider {
        action(self)
        return self
    }
    
    public func valueOn(label:String = "", action: Float -> ()) -> UISlider {
        return self.__on(UIControlEvents.ValueChanged, label: label) { action(($0 as UISlider).value ) } as UISlider
    }
    
    public func valueOff(label:String = "") -> UISlider {
        return self.__off(UIControlEvents.ValueChanged, label: label) as UISlider
    }
}