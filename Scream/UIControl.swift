//
//  UIControl.swift
//  Scream
//
//  Created by Pinglin Tang on 14-10-15.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import UIKit

///MARK:- Public

public extension UIControl {
    
    public func now(action: UIControl -> ()) -> UIControl {
        action(self)
        return self
    }
    
    internal func __on(event:UIControlEvents, label:String = "", action: UIControl -> ()) -> UIControl {
        self.off(event, label:label)
        
        let proxy = UIControlProxy(action)
        self.addTarget(proxy, action: "act:", forControlEvents: event)
        
        let eventKey: String = self.proxyKey(event)
        if self.proxies[eventKey] == nil {
            self.proxies[eventKey] = [String:UIControlProxy]()
        }
        
        self.proxies[eventKey]![label] = proxy
        
        return self
    }

    public func on(event:UIControlEvents, label:String = "", action: UIControl -> ()) -> UIControl {
        return self.__on(event, label: label, action: action)
    }
    
    internal func __off(event:UIControlEvents, label:String = "") -> UIControl {
        
        if let proxy: UIControlProxy = self.proxies[proxyKey(event)]?[label] {
            self.removeTarget(proxy, action: "act:", forControlEvents: event)
            self.proxies[proxyKey(event)]!.removeValueForKey(label)
        }
        return self
    }

    public func off(event:UIControlEvents, label:String = "") -> UIControl {
        return self.__off(event, label: label)
    }
}

///MARK:- Internal

private var UIControlProxiesKey:Void

typealias UIControlProxies = [String: [String: UIControlProxy]]

internal class UIControlProxy : NSObject {
    
    var action: UIControl -> ()
    
    init(_ action: UIControl -> ()) {
        self.action = action
    }
    
    func act(source: UIControl) {
        action(source)
    }
}

internal extension UIControl {
    
    func proxyKey(event:UIControlEvents) -> String {
        return "UIControl:\(event.rawValue)"
    }
    
    func setter(newValue:UIControlProxies) -> UIControlProxies {
        objc_setAssociatedObject(self, &UIControlProxiesKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC));
        return newValue
    }
    
    var proxies: UIControlProxies {
        get {
            if let result = objc_getAssociatedObject(self, &UIControlProxiesKey) as? UIControlProxies {
                return result
            } else {
                return setter(UIControlProxies())
            }
        }
        set {
            setter(newValue)
        }
    }
}