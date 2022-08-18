![LOGO](https://github.com/fanta1ty/TSnackBarView/blob/master/ScreenShot/Logo.png)

# TSnackBarView

TSnackBarView is a simple and flexible UI component fully written in Swift. 
TSnackBarView helps you to show snackbar easily with 3 styles: normal, successful and error

[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-brightgreen)](https://developer.apple.com/swift/)
[![Version](https://img.shields.io/cocoapods/v/TSnackBarView.svg?style=flat)](https://cocoapods.org/pods/TSnackBarView)
[![License](https://img.shields.io/cocoapods/l/TSnackBarView.svg?style=flat)](https://cocoapods.org/pods/TSnackBarView)
[![Platform](https://img.shields.io/cocoapods/p/TSnackBarView.svg?style=flat)](https://cocoapods.org/pods/TSnackBarView)
[![Email](https://img.shields.io/badge/contact-@thinhnguyen12389@gmail.com-blue)](thinhnguyen12389@gmail.com)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TSnackBarView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TSnackBarView'
```

## Usage
```swift
import TSnackBarView
```

To show ``TSnackBarView`` with a normal message:
```swift
TSnackBarServiceImpl.shared.show(on: view,
    message: "Normal SnackBar View\nPlease use Normal SnackBar View for displaying normal text message.",
    onTapCloseAction: { snackBarView in
        snackBarView.dismiss()
    })
```

To show ``TSnackBarView`` with a successfull message:
```swift
TSnackBarServiceImpl.shared.show(on: view,
    message: "Success SnackBar View\nPlease use Success SnackBar View for displaying success text message.",
    style: .success,
    onTapCloseAction: { snackBarView in
            snackBarView.dismiss()
    })
```

To show ``TSnackBarView`` with a error message:
```swift
TSnackBarServiceImpl.shared.show(on: view,
    message: "Error SnackBar View\nPlease use Error SnackBar View for displaying error text message.",
    style: .error,
    onTapCloseAction: { snackBarView in
            snackBarView.dismiss()
    })
```

![alt text](https://github.com/fanta1ty/TSnackBarView/blob/master/ScreenShot/demo.gif)

## Requirements
- iOS 10.0 or later
- Swift 5.0 or later

## Author

fanta1ty, thinhnguyen12389@gmail.com

## License

TSnackBarView is available under the MIT license. See the LICENSE file for more info.
