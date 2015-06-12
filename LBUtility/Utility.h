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

+ (NSString*)getStoredPushToken;

+ (NSString*)getAppVersion;

+ (NSString*)getShortAppVersion;

+ (NSString*)getAutoLoginEmail;

+ (NSString*)getAutoLoginPassword;

+ (void)storePushToken:(NSString*)token;

+ (void)storeAutoLoginEmail:(NSString*)email;

+ (void)storeAutoLoginPassword:(NSString*)password;

+ (void)setupTextField:(UITextField*)textField padding:(CGFloat)padding;

+ (void)setupView:(UIView*)view roundCorner:(CGFloat)round;

@end
