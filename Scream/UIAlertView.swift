//
//  UIAlertView.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-17.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import UIKit

extension UIAlertView {

    convenience init(title: String?, message: String?, cancelButtonTitle: String?, action: (UIAlertView, clickedButtonAtIndex:Int) -> ()) {
        let delegate_ = UIAlertViewDelegate(action)
        self.init(title: title, message:message, delegate:delegate_, cancelButtonTitle:cancelButtonTitle)
        self.__delegate = delegate_
    }
}

private var UIAlertViewDelegateKey:Void

internal class UIAlertViewDelegate : NSObject {

    var action: (UIAlertView, clickedButtonAtIndex:Int) -> ()
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        action(alertView, clickedButtonAtIndex:buttonIndex)
    }
    
    init(_ action: (UIAlertView, clickedButtonAtIndex:Int) -> ()) {
        self.action = action
    }
}

internal extension UIAlertView {

    var __delegate: UIAlertViewDelegate? {
        get {
            return objc_getAssociatedObject(self, &UIAlertViewDelegateKey) as? UIAlertViewDelegate
        }
        set {
            objc_setAssociatedObject(self, &UIAlertViewDelegateKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC));
        }
    }
}