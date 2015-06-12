//
//  LBLanguageManager.h
//  SwiftCam
//
//  Created by billylee on 17/4/2015.
//  Copyright (c) 2015年 swiftcam.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SCLanguageTypeEnglish,
    SCLanguageTypeChinese,
    SCLanguageTypeJapanese,
} SCLanguageType;

static NSString *LBLanguageManager_Language_change = @"LBLanguageManager_Language_change";

@interface LBLanguageManager : NSObject

+ (LBLanguageManager*)sharedManager;

- (void)setMainBundle:(NSBundle*)mainBundle;

- (void)changeLanguage:(SCLanguageType)language;

- (SCLanguageType)getCurrentLanguage;

- (NSString*)getLocalizedString:(NSString*)key;

@end
