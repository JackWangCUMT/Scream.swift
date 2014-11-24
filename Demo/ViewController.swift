//
//  ViewController.swift
//  Demo
//
//  Created by Pinglin Tang on 14/10/23.
//  Copyright (c) 2014年 Pinglin Tang. All rights reserved.
//

import UIKit
import Scream

func randomColor(avoid: UIColor? = nil) -> UIColor {
    
    func randomInRange(range: Range<Int>) -> Int {
        
        let count = UInt32(range.endIndex - range.startIndex)
        return  Int(arc4random_uniform(count)) + range.startIndex
        
    }
    
    var colors_ = [UIColor.blackColor(), UIColor.darkGrayColor(), UIColor.lightGrayColor(), UIColor.grayColor(), UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.cyanColor(), UIColor.yellowColor(), UIColor.magentaColor(), UIColor.orangeColor(), UIColor.purpleColor(), UIColor.brownColor(), UIColor.clearColor()];
    
    colors_ = colors_.filter { $0 != avoid }

    let randomColor_ = colors_[randomInRange(Range(start: 0, end: colors_.count))]
    
    return randomColor_
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let W: Double = self.view.frame.width.native
        var Y: Double = 20.0
        
        var controlLabel_ = UILabel(frame: CGRect(x: 20, y: Y , width: W, height: 20.0))
        controlLabel_.font = UIFont.systemFontOfSize(12.0)
        controlLabel_.text = "UIControl"
        self.view.addSubview(controlLabel_)
        Y += 20
        //UIControl
        var control_ = UIControl(frame:CGRect(x: 20, y: Y, width: W - 40, height: 30)).now {[weak self] control in
            if self == nil { return }
            var strongSelf = self!
            control.backgroundColor = randomColor()
            strongSelf.view.addSubview(control)
        }.when(UIControlEvents.TouchUpInside) {
            $0.backgroundColor = randomColor(avoid:$0.backgroundColor)
        }
        Y += 30

        //UIButton
        Y += 20
        var button_ = UIButton(frame:CGRect(x: 20, y: Y, width: W - 40, height: 30)).now {[weak self] button in
            if self == nil { return }
            var strongSelf = self!
            button.backgroundColor = randomColor()

            button.setTitle("UIButton", forState: UIControlState.Normal)
            strongSelf.view.addSubview(button)
        }.when(UIControlEvents.TouchUpInside) {
            $0.backgroundColor = randomColor(avoid:$0.backgroundColor)
        }
        Y += 30
        
        //TextFieldLabel_
        var textFieldLabel_ = UILabel(frame: CGRect(x: 20, y: Y , width: W, height: 20.0))
        textFieldLabel_.font = UIFont.systemFontOfSize(12.0)
        textFieldLabel_.text = "UITextField"
        self.view.addSubview(textFieldLabel_)
        
        //UITextField
        Y += 20
        var textField_ = UITextField(frame: CGRect(x: 20, y: Y, width: W - 40, height: 30)).now { [weak self] textField in
            if self == nil { return }
            var strongSelf = self!
            textField.backgroundColor = randomColor()
            textField.placeholder = "Please input."
            strongSelf.view.addSubview(textField)
        }.textChanged(label: "1") {
            textFieldLabel_.text = $0
        }
        
        textField_.textChanged(label: "2", action:{ [weak textField_] text in
            textField_!.backgroundColor = randomColor()
        })
        Y += 30

        //UISwitchLabel
        var switchPickerLabel_ = UILabel(frame: CGRect(x: 20, y: Y , width: W, height: 20.0))
        switchPickerLabel_.font = UIFont.systemFontOfSize(12.0)
        switchPickerLabel_.text = "UISwitch"
        self.view.addSubview(switchPickerLabel_)
        Y += 20
        
        //UISwitch
        var switch_ = UISwitch().valueChanged {
            switchPickerLabel_.text = $0.description
        }
        switch_.valueChanged(label: "1", action: { [weak switch_] bool in
            switch_!.tintColor = randomColor(avoid: switch_!.tintColor)
            switch_!.onTintColor = switch_!.tintColor
        })
        switch_.frame.origin.x = 20.0
        switch_.frame.origin.y = CGFloat(Y)
        self.view.addSubview(switch_)
        Y += switch_.frame.height.native
        
        //UIAlertView
        Y += 20
        var alertButton_ = UIButton(frame:CGRect(x: 20, y: Y, width: W - 40, height: 30)).now {[weak self] button in
            if self == nil { return }
            var strongSelf = self!
            button.backgroundColor = randomColor()

            button.setTitle("Alert!", forState: UIControlState.Normal)
            strongSelf.view.addSubview(button)
        }.when(UIControlEvents.TouchUpInside) {
            $0.backgroundColor = randomColor(avoid:$0.backgroundColor)
            UIAlertView(title: "I'm title", message: "I'm message", cancelButtonTitle: "Cancel", otherButtonTitles: "OK?")
                .clicked { buttonAtIndex in
                    UIAlertView(title: "Clicked", message: buttonAtIndex == 0 ? "Cancel" : "OK", cancelButtonTitle: "Cacncel").show()
                }.show()
        }
        Y += 30
        
        //UIDatePickerLabel
        Y += 20
        var datePickerLabel_ = UILabel(frame: CGRect(x: 20, y: Y , width: W, height: 20.0))
        datePickerLabel_.font = UIFont.systemFontOfSize(12.0)
        datePickerLabel_.text = "UIDatePicker"
        self.view.addSubview(datePickerLabel_)
        Y += 20
        
        //UIDatePicker
        var datePicker_ = UIDatePicker().dateChanged { [weak self] date in
            datePickerLabel_.text = date.description
        }
        datePicker_.frame.origin.y = CGFloat(Y)
        self.view.addSubview(datePicker_)
        Y += datePicker_.frame.height.native

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

