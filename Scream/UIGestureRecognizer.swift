//
//  UIGestureRecognizer.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-15.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import UIKit

///MARK:- Public

public extension UIGestureRecognizer {

    convenience init(label:String = "", action: (UIGestureRecognizer) -> ()) {
        
        let proxy = UIGestureRecognizerProxy(action)
        self.init(target:proxy, action:"act:")
        self.proxies[label] = proxy
    }
    
    public func on(label:String = "", action: (UIGestureRecognizer) -> ()) -> UIGestureRecognizer {
        self.off(label:label, action: action)
        
        let proxy = UIGestureRecognizerProxy(action)
        self.proxies[label] = proxy
        self.addTarget(proxy, action:"act:")
        
        return self
    }
    
    public func off(label:String = "", action: (UIGestureRecognizer) -> ()) -> UIGestureRecognizer{
        
        if let proxy = self.proxies[label] {
            self.removeTarget(proxy, action:"act:")
            self.proxies.removeValueForKey(label)
        }
        
        return self
    }
}

///MARK:- Internal

private var UIGestureRecognizerProxiesKey:Void

typealias UIGestureRecognizerProxies = [String:UIGestureRecognizerProxy]

internal class UIGestureRecognizerProxy : NSObject {
    
    var action: UIGestureRecognizer -> ()
    
    init(_ action: UIGestureRecognizer -> ()) {
        self.action = action
    }
    
    func act(source: UIGestureRecognizer) {
        action(source)
    }
}

internal extension UIGestureRecognizer {
    
    func proxyKey(event:UIControlEvents) -> String {
        return "UIGestureRecognizer:\(event.rawValue)"
    }
    
    func setter(newValue:UIGestureRecognizerProxies) -> UIGestureRecognizerProxies {
        objc_setAssociatedObject(self, &UIGestureRecognizerProxiesKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC));
        return newValue
    }
    
    var proxies: UIGestureRecognizerProxies {
        get {
            if let result = objc_getAssociatedObject(self, &UIGestureRecognizerProxiesKey) as? UIGestureRecognizerProxies {
                return result
            } else {
                return setter(UIGestureRecognizerProxies())
            }
        }
        set {
            setter(newValue)
        }
    }
}