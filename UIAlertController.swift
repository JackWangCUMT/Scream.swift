//
//  UIAlertController.swift
//  Scream
//
//  Created by Pinglin Tang on 14/10/27.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    public override func now(action: UIAlertController -> ()) -> UIAlertController {
        action(self)
        return self
    }
    
    public func addAction(title: String, style: UIAlertActionStyle, handler: ((UIAlertAction!) -> Void)!) -> UIAlertController {
        var action = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(action)
        return self;
    }
}
