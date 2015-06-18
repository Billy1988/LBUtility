//
//  LBAnalogView.h
//  SwiftCam
//
//  Created by Billy Lee on 12/5/15.
//  Copyright (c) 2015 swiftcam.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LBAnalogViewDelegate <NSObject>

- (void)analogViewMovedTo:(CGPoint)point;

@end

@interface LBAnalogView : UIView

@property (nonatomic, weak) IBOutlet UIView *joystick;

@property (nonatomic, assign) IBOutlet id<LBAnalogViewDelegate> delegate;

@end
