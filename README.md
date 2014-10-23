#Scream.swift

Scream.swift is a wrapper for UIKit that lets you replace `target` and `selector` with closure.

#Example

Usually in UIViewController:

```swift
func clicked {
  // Do something
}

func repeated {
  // Do something
}

func viewDidLoad {
    self.button = UIButton.buttonWithType(.Custom) as UIButton
    //Custom button
    ....
    self.buton.addTarget(self, action: "clicked", forControlEvents: UIControlEvents.TouchUpInside)
    self.buton.addTarget(self, action: "repeated", forControlEvents: UIControlEvents.TouchDownRepeat)

}

```

Let's replace `target` and `selector` with closure using Scream.swift.
```swift
func viewDidLoad {
    self.button = (UIButton.buttonWithType(.Custom) as UIButton).now{ btn in
      //Custom button
      ...
    }.clicked { btn in
      //Do something
    }.when(label:"repeat") {
      //Do something
    }
}
```
