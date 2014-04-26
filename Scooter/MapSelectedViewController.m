//
//  MapSelectedViewController.m
//  Scooter
//
//  Created by xingyanl on 3/23/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "MapSelectedViewController.h"
#import "MapDisplayedViewController.h"

@interface MapSelectedViewController ()

- (void)_initView;
- (void)_initPortraitView;
- (void)_initLandscapeView;

@end

@implementation MapSelectedViewController

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
    // Do any additional setup after loading the view from its nib.
    [self _initView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"Deside which view is self.view? landscape or portrait");
    [self setPortraitView:self.portraitView landscapeView:self.landscapeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)
toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self setOrientationView:toInterfaceOrientation duration:duration portraitView:self.portraitView landscapeView:self.landscapeView];
}

#pragma mark - Action Methods
- (IBAction)mapSelectedButtonPressed:(id)sender {
    MapDisplayedViewController *displayedViewCtrl = [[MapDisplayedViewController alloc] init];
    [self.navigationController pushViewController:displayedViewCtrl animated:YES];
    
        // 跳转到你想要的任何一个界面
//    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
}

- (IBAction)lockButtonPressed:(id)sender {
}

#pragma mark - Private Methods
- (void)_initView
{
    [self _initPortraitView];
    [self _initLandscapeView];
}

- (void)_initPortraitView
{
    //如何让button的标题文字居中
    _mapPortraitBtn.titleLabel.lineBreakMode = 0;
    _mapPortraitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_mapPortraitBtn setTitle:LocalizeString(@"Map") forState:UIControlStateNormal];
    
    [_lockPortraitBtn setTitle:LocalizeString(@"Lock")  forState:UIControlStateNormal];
    // 设置button的图片和文字
    [_lockPortraitBtn setImage:[UIImage imageNamed:@"lock.png"] forState:UIControlStateNormal];
    [_lockPortraitBtn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -20, 0.0, 0.0)];
    _lockPortraitBtn.center = CGPointMake(_lockPortraitBtn.center.x, _mapPortraitBtn.center.y);
}

- (void)_initLandscapeView
{
    _mapLandscapeBtn.titleLabel.lineBreakMode = 0;
    _mapLandscapeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_mapLandscapeBtn setTitle:LocalizeString(@"Map") forState:UIControlStateNormal];
    
    // 设置button的图片和文字
    [_lockLandscapeBtn setTitle:LocalizeString(@"Lock")  forState:UIControlStateNormal];
    [_lockLandscapeBtn setImage:[UIImage imageNamed:@"lock.png"] forState:UIControlStateNormal];
    [_lockLandscapeBtn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -20, 0.0, 0.0)];
    _lockLandscapeBtn.center = CGPointMake(_lockLandscapeBtn.center.x, _mapLandscapeBtn.center.y);
}

@end
