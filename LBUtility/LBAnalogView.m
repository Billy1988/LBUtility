//
//  LBAnalogView.m
//  SwiftCam
//
//  Created by Billy Lee on 12/5/15.
//  Copyright (c) 2015 swiftcam.com. All rights reserved.
//

#import "LBAnalogView.h"

#define STICK_CENTER_TARGET_POS_LEN 20.0f

@interface LBAnalogView()

@property (nonatomic, assign) CGRect originJoystickFrame;
@property (nonatomic, assign) CGPoint originJoystickCenter;
@property (nonatomic, assign) CGPoint mCenter;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation LBAnalogView

- (void)awakeFromNib {
    self.originJoystickFrame = self.joystick.frame;
    self.originJoystickCenter = self.joystick.center;
    self.mCenter = CGPointMake(self.frame.size.width / 2.0f, self.frame.size.height / 2.0f);
}

- (void)notifyDir:(NSTimer*)timer {
    
    NSNumber *x = timer.userInfo[@"dirX"];
    NSNumber *y = timer.userInfo[@"dirY"];
    CGPoint movement = CGPointMake(x.floatValue, y.floatValue);
    if ([self.delegate respondsToSelector:@selector(analogViewMovedTo:)]) {
        [self.delegate analogViewMovedTo:movement];
    }
}

- (void)notifyDirection:(CGPoint)dir {
    if ([self.delegate respondsToSelector:@selector(analogViewMovedTo:)]) {
        [self.delegate analogViewMovedTo:dir];
    }
    if (self.timer != nil) {
        [self.timer invalidate];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(notifyDir:) userInfo:@{@"dirX":@(dir.x), @"dirY":@(dir.y)} repeats:YES];
}

- (void)stickMoveTo:(CGPoint)deltaToCenter {
    CGRect fr = self.joystick.frame;
    fr.origin.x = deltaToCenter.x;
    fr.origin.y = deltaToCenter.y;
    self.joystick.frame = fr;
}

- (void)touchEvent:(NSSet *)touches {
    
    if([touches count] != 1)
        return ;
    
    UITouch *touch = [touches anyObject];
    UIView *view = [touch view];
    if(view != self)
        return ;
    
    CGPoint touchPoint = [touch locationInView:view];
    CGPoint dir;
    dir.x = touchPoint.x - self.mCenter.x;
    dir.y = touchPoint.y - self.mCenter.y;
    
    dir.x = touchPoint.x - self.joystick.frame.size.width / 2.0f;
    dir.y = touchPoint.y - self.joystick.frame.size.height / 2.0f;
    
    [self stickMoveTo:dir];
    
    CGPoint movement = CGPointMake(touchPoint.x - self.mCenter.x, touchPoint.y - self.mCenter.y);
    
    [self notifyDirection:movement];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchEvent:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchEvent:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.joystick.frame = self.originJoystickFrame;
    [self.timer invalidate];
    self.timer = nil;
    if ([self.delegate respondsToSelector:@selector(analogViewMovedTo:)]) {
        [self.delegate analogViewMovedTo:CGPointMake(0, 0)];
    }
}

@end
