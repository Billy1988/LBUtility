//
//  LBLanguageManager.m
//  SwiftCam
//
//  Created by billylee on 17/4/2015.
//  Copyright (c) 2015年 swiftcam.com. All rights reserved.
//

#import "LBLanguageManager.h"

#define LBLanguageManager_preset_language @"LBLanguageManager_preset_language"

@interface LBLanguageManager()

@property (nonatomic, strong) NSBundle *mainBundle;
@property (nonatomic, strong) NSBundle *localeBundle;

@property (nonatomic, assign) LBLanguageType languageType;

@end

@implementation LBLanguageManager


+ (LBLanguageManager*)sharedManager {
    static LBLanguageManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[LBLanguageManager alloc] init];
    });
    
    return _manager;
}

- (void)setMainBundle:(NSBundle*)mainBundle {
    _mainBundle = mainBundle;
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *presetLanguage = [userDefault objectForKey:LBLanguageManager_preset_language];
    NSString *language = presetLanguage.length > 0 ? presetLanguage : [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *path = [self.mainBundle pathForResource:language ofType:@"lproj"];
    if (path) {
        self.localeBundle = [NSBundle bundleWithPath:path];
    } else {
        self.localeBundle = [NSBundle bundleWithPath:[self.mainBundle pathForResource:@"en" ofType:@"lproj"] ];
    }
    
    if ([language isEqualToString:@"en"]) {
        self.languageType = LBLanguageTypeEnglish;
    } else if([language isEqualToString:@"zh-Hant"]) {
        self.languageType = LBLanguageTypeChinese;
    } else if([language isEqualToString:@"ja"]) {
        self.languageType = LBLanguageTypeJapanese;
    }
}

- (void)changeLanguage:(LBLanguageType)language {
    NSAssert(self.mainBundle, @"Please call [setMainBundle] first!!");
    
    NSString *string = @"en";
    switch (language) {
        default:
        case LBLanguageTypeEnglish:
            self.languageType = LBLanguageTypeEnglish;
            string = @"en";
            break;
        case LBLanguageTypeJapanese:
            self.languageType = LBLanguageTypeJapanese;
            string = @"ja";
            break;
        case LBLanguageTypeChinese:
            self.languageType = LBLanguageTypeChinese;
            string = @"zh-Hant";
            break;
    }
    
    NSString *path = [self.mainBundle pathForResource:string ofType:@"lproj"];
    if (path) {
        self.localeBundle = [NSBundle bundleWithPath:path];
    }
    [[NSUserDefaults standardUserDefaults] setObject:string forKey:LBLanguageManager_preset_language];
    [[NSNotificationCenter defaultCenter] postNotificationName:LBLanguageManager_Language_change object:nil];
}

- (LBLanguageType)getCurrentLanguage {
    NSAssert(self.mainBundle, @"Please call [setMainBundle] first!!");
    
    return self.languageType;
}

- (NSString*)getLocalizedString:(NSString*)key {
    NSAssert(self.mainBundle, @"Please call [setMainBundle] first!!");
    
    if (self.localeBundle == nil) return key;
    
    NSString *string = [self.localeBundle localizedStringForKey:key value:key table:nil];
    
    return string.length > 0 ? string : key;
}

@end
