//
//  UIDatePicker.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-15.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import Foundation

extension UIDatePicker {
    
    public override func now(action: UIDatePicker -> ()) -> UIDatePicker {
        action(self)
        return self
    }
    
    public func dateOn(label:String = "", action: NSDate -> ()) -> UIDatePicker {
        return self.__on(UIControlEvents.ValueChanged, label: label) { action(($0 as UIDatePicker).date ) } as UIDatePicker
    }
    
    public func dateOff(label:String = "") -> UIDatePicker {
        return self.__off(UIControlEvents.ValueChanged, label: label) as UIDatePicker
    }
    
}