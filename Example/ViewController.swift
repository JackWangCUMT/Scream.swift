//
//  ViewController.swift
//  Example
//
//  Created by Pinglin Tang on 14-10-15.
//  Copyright (c) 2014 Pinglin Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let control =
        UIControl(frame: CGRectMake(110, 100, 100, 100)).now {
                $0.backgroundColor = UIColor.orangeColor()
        }.when(UIControlEvents.TouchUpInside, label: "1") {
                $0.backgroundColor = UIColor.redColor()
                println("1")
        }.when(UIControlEvents.TouchUpInside, label: "2") {
                $0.backgroundColor = UIColor.blackColor()
                println("2")
        }
        
//        let button = UIButton()
        self.view.addSubview(control)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

