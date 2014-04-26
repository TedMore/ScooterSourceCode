//
//  UIBaseNavigationViewController.m
//  Scooter
//
//  Created by xingyanl on 14-4-25.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import "UIBaseNavigationViewController.h"

@interface UIBaseNavigationViewController ()

@end

@implementation UIBaseNavigationViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Rotate
- (BOOL)shouldAutorotate
{
    // 为每个Controller分别定制rotate的模式和方向
//    return [[self.viewControllers lastObject] shouldAutorotate];
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
//    return [[self.viewControllers lastObject]supportedInterfaceOrientations];
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return [self.viewControllers lastObject] preferredInterfaceOrientationForPresentation;
//    return UIInterfaceOrientationPortrait;
//}

@end
