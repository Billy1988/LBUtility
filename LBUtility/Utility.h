//
//  Utility.h
//  SwiftCam
//
//  Created by billylee on 16/4/2015.
//  Copyright (c) 2015年 swiftcam.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, InterfaceOrientationType) {
    InterfaceOrientationTypePortrait,
    InterfaceOrientationTypeLandscape
};

@interface Utility : NSObject

+ (InterfaceOrientationType)orientation;

+ (NSUserDefaults*)getUserDefault;

+ (NSString*)getAppVersion;

+ (NSString*)getShortAppVersion;

@end
