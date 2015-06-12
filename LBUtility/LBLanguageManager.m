//
//  LBLanguageManager.m
//  SwiftCam
//
//  Created by billylee on 17/4/2015.
//  Copyright (c) 2015年 swiftcam.com. All rights reserved.
//

#import "LBLanguageManager.h"

#define swiftcam_language @"swiftcam_language"

@interface LBLanguageManager()

@property (nonatomic, strong) NSBundle *localeBundle;

@property (nonatomic, assign) SCLanguageType languageType;

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

- (id)init {
    if (self = [super init]) {
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSString *presetLanguage = [userDefault objectForKey:swiftcam_language];
        NSString *language = presetLanguage.length > 0 ? presetLanguage : [[NSLocale preferredLanguages] objectAtIndex:0];
        NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
        if (path) {
            self.localeBundle = [NSBundle bundleWithPath:path];
        } else {
            self.localeBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"] ];
        }
        
        if ([language isEqualToString:@"en"]) {
            self.languageType = SCLanguageTypeEnglish;
        } else if([language isEqualToString:@"zh-Hant"]) {
            self.languageType = SCLanguageTypeChinese;
        } else if([language isEqualToString:@"ja"]) {
            self.languageType = SCLanguageTypeJapanese;
        }
    }
    return self;
}

- (void)changeLanguage:(SCLanguageType)language {
    NSString *string = @"en";
    switch (language) {
        default:
        case SCLanguageTypeEnglish:
            self.languageType = SCLanguageTypeEnglish;
            string = @"en";
            break;
        case SCLanguageTypeJapanese:
            self.languageType = SCLanguageTypeJapanese;
            string = @"ja";
            break;
        case SCLanguageTypeChinese:
            self.languageType = SCLanguageTypeChinese;
            string = @"zh-Hant";
            break;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    if (path) {
        self.localeBundle = [NSBundle bundleWithPath:path];
    }
    [[NSUserDefaults standardUserDefaults] setObject:string forKey:swiftcam_language];
    [[NSNotificationCenter defaultCenter] postNotificationName:LBLanguageManager_Language_change object:nil];
}

- (SCLanguageType)getCurrentLanguage {
    return self.languageType;
}

- (NSString*)getLocalizedString:(NSString*)key {
    return [self.localeBundle localizedStringForKey:key value:key table:nil];
}

@end
