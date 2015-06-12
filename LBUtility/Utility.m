//
//  Utility.m
//  SwiftCam
//
//  Created by billylee on 16/4/2015.
//  Copyright (c) 2015年 swiftcam.com. All rights reserved.
//

#import "Utility.h"

#define PUSH_TOKEN  @"PUSH_TOKEN"
#define AUTO_LOGIN_EMAIL @"AUTO_LOGIN_EMAIL"
#define AUTO_LOGIN_PASSWORD @"AUTO_LOGIN_PASSWORD"

@implementation Utility

+ (InterfaceOrientationType)orientation{
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize nativeSize = [UIScreen mainScreen].currentMode.size;
    CGSize sizeInPoints = [UIScreen mainScreen].bounds.size;
    
    InterfaceOrientationType result;
    
    if(scale * sizeInPoints.width == nativeSize.width){
        result = InterfaceOrientationTypePortrait;
    }else{
        result = InterfaceOrientationTypeLandscape;
    }
    
    return result;
}

+ (NSUserDefaults*)getUserDefault {
    return [NSUserDefaults standardUserDefaults];
}

+ (NSString*)getStoredPushToken {
    return [[Utility getUserDefault] objectForKey:PUSH_TOKEN];
}

+ (NSString*)getAppVersion {
    NSBundle *bundle = [NSBundle mainBundle];
    return bundle.infoDictionary[@"CFBundleShortVersionString"];
}

+ (NSString*)getShortAppVersion {
    NSBundle *bundle = [NSBundle mainBundle];
    return bundle.infoDictionary[@"CFBundleVersion"];
}

+ (NSString*)getAutoLoginEmail {
    return [[Utility getUserDefault] objectForKey:AUTO_LOGIN_EMAIL];
}

+ (NSString*)getAutoLoginPassword {
    return [[Utility getUserDefault] objectForKey:AUTO_LOGIN_PASSWORD];
}

+ (void)storeAutoLoginEmail:(NSString *)email {
    [[Utility getUserDefault] setObject:email forKey:AUTO_LOGIN_EMAIL];
}

+ (void)storeAutoLoginPassword:(NSString *)password {
    [[Utility getUserDefault] setObject:password forKey:AUTO_LOGIN_PASSWORD];
}

+ (void)storePushToken:(NSString *)token {
    [[Utility getUserDefault] setObject:token forKey:PUSH_TOKEN];
}

+ (void)setupTextField:(UITextField*)textField padding:(CGFloat)padding {
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, padding)];
    textField.rightViewMode = UITextFieldViewModeAlways;
    textField.rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, padding)];
}

+ (void)setupView:(UIView *)view roundCorner:(CGFloat)round {
    view.layer.cornerRadius = round;
    view.layer.masksToBounds = YES;
}

@end
