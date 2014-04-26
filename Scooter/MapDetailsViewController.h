//
//  MapDetailsViewController.h
//  ScooterTest
//
//  Created by xingyanl on 3/24/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "UIBaseViewController.h"
#import "UIRectangle.h"

@interface MapDetailsViewController : UIBaseViewController

// 竖屏及其元素
@property (strong, nonatomic) IBOutlet UIView *portraitView;
@property (strong, nonatomic) IBOutlet UIButton *backPortraitBtn;
@property (strong, nonatomic) IBOutlet UIButton *backRootPortraitBtn;

// 横屏及其元素
@property (strong, nonatomic) IBOutlet UIView *landscapeView;
@property (strong, nonatomic) IBOutlet UIButton *backLandscapeBtn;
@property (strong, nonatomic) IBOutlet UIButton *backRootLandscapeBtn;

@property (strong, nonatomic) NSArray *valueArray;

// 接收的最下方图片，显示的东西
@property (strong, nonatomic) NSString *leftValue;
@property (strong, nonatomic) NSString *rightValue;
@property (strong, nonatomic) NSString *midValue;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)backRootButtonPressed:(id)sender;

@end
