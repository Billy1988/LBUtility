//
//  LBUtility.h
//  LBUtility
//
//  Created by Billy Lee on 12/6/15.
//  Copyright (c) 2015 Billy Lee. All rights reserved.
//

#ifndef LBUtility_LBUtility_h
#define LBUtility_LBUtility_h

#import "LBBaseViewController.h"
#import "LBButton.h"
#import "LBImageView.h"
#import "LBLanguageManager.h"
#import "LBView.h"
#import "Utility.h"

#define LBString(key) [[LBLanguageManager sharedManager] getLocalizedString:key]

#define UIColorWith256RGB(r, g, b) UIColorWith256ARGB(1.0f, r, g, b)

#define UIColorWith256ARGB(a, r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define UIColorWithRGB(r, g, b) UIColorWithARGB(1.0f, r, g, b)

#define UIColorWithARGB(a, r, g, b) [UIColor colorWithRed:r green:g blue:b alpha:a]

#endif
