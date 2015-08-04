# LBUtility-ios

[![CI Status](http://img.shields.io/travis/Billy Lee/LBUtility.svg?style=flat)](https://travis-ci.org/Billy Lee/LBUtility)
[![Version](https://img.shields.io/cocoapods/v/LBUtility.svg?style=flat)](http://cocoapods.org/pods/LBUtility)
[![License](https://img.shields.io/cocoapods/l/LBUtility.svg?style=flat)](http://cocoapods.org/pods/LBUtility)
[![Platform](https://img.shields.io/cocoapods/p/LBUtility.svg?style=flat)](http://cocoapods.org/pods/LBUtility)

## Usage

#Simple usage
include it in header
```objective-c
#inclue "LBUtility.h"
```

Some useful marco is provided :)
```objective-c
LBString(@"key")

UIColorWith256RGB(255, 255, 255)
UIColorWith256ARGB(255, 255, 255, 255)
UIColorWithRGB(1, 1, 1)
UIColorWithARGB(1, 1, 1, 1)

DLog(@"Hello world!");
```

#LBAnalogView
This is a view build with UIView, it is trying to simulate AnalogView.

#LBButton / LBView / LBImageView
It can also use in storyboard

cornerRadius : To make a round corner button without 1 line coding :)
verticalAlignTextAndImage : To create a button with Image(Top) & Text(Bottom)

## Requirements
Language : objective-c
Platform : iOS 8+

## Installation

LBUtility is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LBUtility"
```

## Author

Billy Lee, lchb1988@gmail.com

## License

LBUtility is available under the MIT license. See the LICENSE file for more info.
