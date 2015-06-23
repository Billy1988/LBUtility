//
//  Utility.m
//  SwiftCam
//
//  Created by billylee on 16/4/2015.
//  Copyright (c) 2015年 swiftcam.com. All rights reserved.
//

#import "Utility.h"

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

+ (NSString*)getAppVersion:(NSBundle *)bundle {
    return bundle.infoDictionary[@"CFBundleShortVersionString"];
}

+ (NSString*)getShortAppVersion:(NSBundle *)bundle {
    return bundle.infoDictionary[@"CFBundleVersion"];
}

@end
