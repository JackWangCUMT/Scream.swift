//
//  UIViewController.swift
//  Scream
//
//  Created by Pinglin Tang on 14/11/23.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import UIKit

public extension UIViewController {

    public func now(action: UIViewController -> ()) -> UIViewController {
        action(self)
        return self
    }

}
