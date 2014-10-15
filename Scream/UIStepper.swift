//
//  UIStepper.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-15.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import Foundation

extension UIStepper {
    
    public override func now(action: UIStepper -> ()) -> UIStepper {
        action(self)
        return self
    }
    
    public func valueOn(label:String = "", action: Double -> ()) -> UIStepper {
        return self.__on(UIControlEvents.ValueChanged, label: label) { action(($0 as UIStepper).value ) } as UIStepper
    }
    
    public func valueOff(label:String = "") -> UIStepper {
        return self.__off(UIControlEvents.ValueChanged, label: label) as UIStepper
    }
}