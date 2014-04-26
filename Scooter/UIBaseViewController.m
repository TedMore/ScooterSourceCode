//
//  ModuleProtocol.h
//  Scooter
//
//  Created by xingyanl on 14-3-31.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import "UIBaseViewController.h"
#import "GlobalUICommon.h"

@interface UIBaseViewController ()

@end

@implementation UIBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLabelLayer:(UILabel *)label
{
    label.layer.borderColor = [UIColor whiteColor].CGColor;
    label.layer.borderWidth = 1;
    label.layer.cornerRadius = 10;
    
    label.textAlignment = NSTextAlignmentCenter;
}

- (void)setPortraitView:(UIView *)pView landscapeView:(UIView *)lView
{
    // 设置背景颜色
    [pView setBackgroundColor:BackgroundColor];
    [lView setBackgroundColor:BackgroundColor];
    
    UIApplication *app = [UIApplication sharedApplication];
    
    // 判断当前的设备的方向
    if ((app.statusBarOrientation == UIInterfaceOrientationLandscapeLeft) || (app.statusBarOrientation == UIInterfaceOrientationLandscapeRight) ) {
        self.view = lView;
        NSLog(@"The self.view is landscape");
    }
    else if (app.statusBarOrientation == UIInterfaceOrientationPortrait)
    {
        self.view = pView;
        NSLog(@"The self.view is portraitView!");
    }
    else
    {
        NSLog(@"Do not decide current view!");
    }
}

- (void)setOrientationView:(UIInterfaceOrientation)
toInterfaceOrientation duration:(NSTimeInterval)duration portraitView:(UIView *)pView landscapeView:(UIView *)lView;
{
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view = lView;
        //        self.view.transform=CGAffineTransformMakeRotation(deg2rad*(90));
        NSLog(@"lView");
    } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        self.view = lView;
        //        self.view.transform=CGAffineTransformMakeRotation(deg2rad*(-90));
        NSLog(@"lView");
    } else {
        self.view = pView;
        //        self.view.transform=CGAffineTransformMakeRotation(deg2rad*(0));
        NSLog(@"pView");
    }
    
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

@end
