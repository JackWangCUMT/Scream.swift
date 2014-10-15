//
//  UISwitch.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-15.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import Foundation

extension UISwitch {
    
    public override func now(action: UISwitch -> ()) -> UISwitch {
        action(self)
        return self
    }
    
    public func onOn(label:String = "", action: Bool -> ()) -> UISwitch {
        return self.__on(UIControlEvents.ValueChanged, label: label) { action(($0 as UISwitch).on ) } as UISwitch
    }
    
    public func onOff(label:String = "") -> UISwitch {
        return self.__off(UIControlEvents.ValueChanged, label: label) as UISwitch
    }
}