//
//  LBButton.m
//  Dvp
//
//  Created by Billy Lee on 18/5/15.
//  Copyright (c) 2015 Billy Lee. All rights reserved.
//

#import "LBButton.h"

@implementation LBButton

- (void)awakeFromNib {
    if (self.cornerRadius > 0) {
        self.layer.cornerRadius = self.cornerRadius;
        self.layer.masksToBounds = YES;
    }
}

@end
