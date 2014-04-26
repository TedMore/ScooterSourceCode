//
//  MapDisplayedViewController.h
//  Scooter
//
//  Created by xingyanl on 3/23/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "UIBaseViewController.h"

@interface MapDisplayedViewController : UIBaseViewController
{
    @private
    NSArray *_standard;
    NSArray *_climbing;
    NSArray *_economy;
    NSArray *_sports;
    NSArray *_highway;
}


// 竖屏及其元素
@property (strong, nonatomic) IBOutlet UIView *portraitView;
// 按钮
@property (strong, nonatomic) IBOutlet UIButton *standardPortraitBtn;
@property (strong, nonatomic) IBOutlet UIButton *climbingPortraitBtn;
@property (strong, nonatomic) IBOutlet UIButton *economyPortraitBtn;
@property (strong, nonatomic) IBOutlet UIButton *sportsPortraitBtn;
@property (strong, nonatomic) IBOutlet UIButton *highwayPortraitBtn;

// 图片
@property (strong, nonatomic) IBOutlet UIImageView *standardPortraitImage;
@property (strong, nonatomic) IBOutlet UIImageView *climbingPortraitImage;
@property (strong, nonatomic) IBOutlet UIImageView *economyPortraitImage;
@property (strong, nonatomic) IBOutlet UIImageView *sportsPortraitImage;
@property (strong, nonatomic) IBOutlet UIImageView *highwayPortraitImage;

@property (strong, nonatomic) IBOutlet UIButton *displayedPortraitBtn;

// 横屏及其元素
@property (strong, nonatomic) IBOutlet UIView *landscapeView;

// 按钮
@property (strong, nonatomic) IBOutlet UIButton *standardLandscapeBtn;
@property (strong, nonatomic) IBOutlet UIButton *climbingLandscapeBtn;
@property (strong, nonatomic) IBOutlet UIButton *economyLandscapeBtn;
@property (strong, nonatomic) IBOutlet UIButton *sportsLandscapeBtn;
@property (strong, nonatomic) IBOutlet UIButton *highwayLandscapeBtn;

@property (strong, nonatomic) IBOutlet UIButton *displayedLandscapeBtn;

// 图片
@property (strong, nonatomic) IBOutlet UIImageView *standardLandscapeImage;
@property (strong, nonatomic) IBOutlet UIImageView *climbingLandscapeImage;
@property (strong, nonatomic) IBOutlet UIImageView *economyLandscapeImage;
@property (strong, nonatomic) IBOutlet UIImageView *sportsLandscapeImage;
@property (strong, nonatomic) IBOutlet UIImageView *highwayLandscapeImage;

- (IBAction)standardPressed:(id)sender;
- (IBAction)climbingPressed:(id)sender;
- (IBAction)economyPressed:(id)sender;
- (IBAction)sportsPressed:(id)sender;
- (IBAction)highwayPressed:(id)sender;


- (IBAction)displayedButtonPressed:(id)sender;

@end
