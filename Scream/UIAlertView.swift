//
//  UIAlertView.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-17.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import UIKit

public extension UIAlertView {

    public convenience init(title: String, message: String, cancelButtonTitle: String?, otherButtonTitles firstButtonTitle: String, _ moreButtonTitles: String...) {
        let delegate_ = UIAlertViewDelegate()
        self.init(title: title, message:message, delegate:delegate_, cancelButtonTitle:cancelButtonTitle)
        self.addButtonWithTitle(firstButtonTitle)
        for buttonTitle in moreButtonTitles {
            self.addButtonWithTitle(buttonTitle)
        }
    }

    public convenience init(title: String?, message: String?, cancelButtonTitle: String?) {
        let delegate_ = UIAlertViewDelegate()
        self.init(title: title, message:message, delegate:delegate_, cancelButtonTitle:cancelButtonTitle)
        self.__delegate = delegate_
    }
    
    public func clicked(action:((buttonAtIndex:Int) -> ())?) -> UIAlertView {
        self.__delegate?.clicked = action
        return self;
    }
    
    public func cancel(action:(@autoclosure () -> ())?) -> UIAlertView {
        self.__delegate?.cancel = action
        return self;
    }
    
    public func willPresent(action:(@autoclosure () -> ())?) -> UIAlertView {
        self.__delegate?.willPresent = action
        return self;
    }
    
    public func didPresent(action:(@autoclosure () -> ())?) -> UIAlertView {
        self.__delegate?.didPresent = action
        return self;
    }
    
    public func willDismiss(action:(@autoclosure () -> ())?) -> UIAlertView {
        self.__delegate?.willPresent = action
        return self;
    }
    
    public func didDismiss(action:((buttonAtIndex:Int) -> ())?) -> UIAlertView {
        self.__delegate?.didDismiss = action
        return self;
    }
}

internal class UIAlertViewDelegate : NSObject {

    typealias Action = () -> ()
    typealias IndexAction = (Int) -> ()
    
    var clicked:IndexAction?
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        self.clicked?(buttonIndex)
    }

    var cancel:Action?
    
    func alertViewCancel(alertView: UIAlertView) {
        self.cancel?()
    }
    
    var willPresent:Action?
    
    func willPresentAlertView(alertView: UIAlertView) {
        self.willPresent?()
    }
    
    var didPresent:Action?
    
    func didPresentAlertView(alertView: UIAlertView) {
        self.didPresent?()
    }
    
    var willDismiss:IndexAction?
    func alertView(alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
        self.willDismiss?(buttonIndex)
    }
    
    var didDismiss:IndexAction?
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        self.didDismiss?(buttonIndex)
    }
}

private var UIAlertViewDelegateKey:Void

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