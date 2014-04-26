//
//  MapSelectedViewController.h
//  Scooter
//
//  Created by xingyanl on 3/23/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "UIBaseViewController.h"

@interface MapSelectedViewController : UIBaseViewController

// 竖屏元素
@property (strong, nonatomic) IBOutlet UIView *portraitView;
@property (strong, nonatomic) IBOutlet UIButton *mapPortraitBtn;
@property (strong, nonatomic) IBOutlet UIButton *lockPortraitBtn;

// 横屏元素
@property (strong, nonatomic) IBOutlet UIView *landscapeView;
@property (strong, nonatomic) IBOutlet UIButton *mapLandscapeBtn;
@property (strong, nonatomic) IBOutlet UIButton *lockLandscapeBtn;

- (IBAction)mapSelectedButtonPressed:(id)sender;
- (IBAction)lockButtonPressed:(id)sender;

@end
