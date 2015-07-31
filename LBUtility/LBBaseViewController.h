//
//  LBBaseViewController.h
//  SwiftCam
//
//  Created by billylee on 16/4/2015.
//  Copyright (c) 2015年 swiftcam.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertButtonHandler)(UIAlertAction *action);

@interface LBBaseViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *titleView;

@property (nonatomic, strong) IBOutlet UIView *navLeftView;

@property (nonatomic, strong) IBOutlet UIView *navRightView;

+ (id)getDefaultController;

- (void)showLoadingDialog:(BOOL)animated;

- (void)showLoadingDialogWithTitle:(NSString*)title;

- (void)showLoadingDialog:(NSString*)title animated:(BOOL)animated;

- (void)showLoadingDialog:(NSString*)title message:(NSString*)message animated:(BOOL)animated;

- (void)dismissLoadingDialog:(BOOL)animated;

- (void)showProgressDialog:(NSString*)title message:(NSString*)message progress:(float)progress;

- (void)dismissProgressDialog:(BOOL)animated;

- (void)dismissAllHUD:(BOOL)animated;

- (void)showAlertOK:(NSString*)title message:(NSString*)message;

- (void)showAlertOK:(NSString*)title message:(NSString*)message handler:(AlertButtonHandler)handler;

- (void)showAlertOK:(NSString*)title message:(NSString*)message buttonText:(NSString*)button handler:(AlertButtonHandler)handler;

- (void)showAlert:(NSString*)title
          message:(NSString*)message
       buttonText:(NSString*)buttonText
    buttonHandler:(AlertButtonHandler)handler
       cancelText:(NSString*)cancelText
    cancelHandler:(AlertButtonHandler)cancelHandler;

- (void)showAlert:(NSString*)title message:(NSString*)message buttons:(NSArray*)buttons;

+ (UIAlertController*)alertViewControllerWithTitle:(NSString*)title
                                           message:(NSString*)message
                                        buttonText:(NSString*)buttonText
                                     buttonHandler:(AlertButtonHandler)handler
                                        cancelText:(NSString*)cancelText
                                     cancelHandler:(AlertButtonHandler)cancelHandler;

+ (UIAlertController*)alertViewControllerWithTitle:(NSString*)title message:(NSString*)message buttons:(NSArray*)buttons;

@end

@interface AlertButton : NSObject 

@property (nonatomic, strong) NSString *buttonString;
@property (nonatomic, assign) UIAlertActionStyle style;
@property (nonatomic, assign) AlertButtonHandler handler;

+ (id)initWithText:(NSString*)title handler:(AlertButtonHandler)handler;

+ (id)initWithText:(NSString*)title style:(UIAlertActionStyle)style handler:(AlertButtonHandler)handler;

@end

