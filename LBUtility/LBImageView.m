//
//  LBImageView.m
//  Dvp
//
//  Created by Billy Lee on 18/5/15.
//  Copyright (c) 2015 Billy Lee. All rights reserved.
//

#import "LBImageView.h"

@implementation LBImageView

- (void)awakeFromNib {
    if (self.isFullCircle) {
        self.layer.cornerRadius = self.frame.size.width / 2.0f;
        self.layer.masksToBounds = YES;
    }
    if (self.cornerRadius > 0) {
        self.layer.cornerRadius = self.cornerRadius;
        self.layer.masksToBounds = YES;
    }
}

@end
