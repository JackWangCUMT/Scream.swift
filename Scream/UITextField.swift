//
//  UITextField.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-15.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import Foundation

public extension UITextField {
    
    public override func now(action: UITextField -> ()) -> UITextField {
        action(self)
        return self
    }
    
    public func textOn(label:String = "", action: String -> ()) -> UITextField {
        return self.__on(UIControlEvents.EditingChanged | UIControlEvents.EditingDidBegin, label: label) { action(($0 as UITextField).text ) } as UITextField
    }
    
    public func textOff(label:String = "") -> UITextField {
        return self.__off(UIControlEvents.EditingChanged | UIControlEvents.EditingDidBegin, label: label) as UITextField
    }
}
