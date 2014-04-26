//
//  ResultViewController.m
//  Scooter
//
//  Created by xingyanl on 14-4-3.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import "ResultViewController.h"
#import "MapSelectedViewController.h"

@interface ResultViewController ()

- (void)_initView;
- (void)_initPortraitView;
- (void)_initLandscapeView;
- (void)_GoToMapSelected;
- (void)_GoToConnectivity;

@end

@implementation ResultViewController

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

- (void)viewDidAppear:(BOOL)animated
{
    if (self.connected) {
        [self performSelector:@selector(_GoToMapSelected) withObject:nil afterDelay:2];
    }
    else
    {
        [self performSelector:@selector(_GoToConnectivity) withObject:nil afterDelay:2];
    }

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

#pragma mark - Private Methods
// 这种跳转方式，很不合理
- (void)_initView
{
    [self _initPortraitView];
    [self _initLandscapeView];
}

- (void)_initPortraitView
{
    self.portraitImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 用来判断蓝牙是否连接成功，从而决定显示成功还是失败的页面
    if (self.connected) {
        self.portraitImageView.image = [UIImage imageNamed:@"binggo.png"];
    } else {
        self.portraitImageView.image = [UIImage imageNamed:@"error.png"];
    }

    SCAutoresizingLabel *connectLabel = InitializeAutoLabel(0.0f, self.portraitImageView.frame.origin.y + self.portraitImageView.frame.size.height + 5.0f);
    connectLabel.center = CGPointMake(self.portraitImageView.center.x - 60.0f, connectLabel.center.y);
    connectLabel.text = @"connect";
    
    //
    SCAutoresizingLabel *resultLabel = InitializeAutoLabel(connectLabel.frame.origin.x + connectLabel.frame.size.width + 10.0f, connectLabel.frame.origin.y);
    if (self.connected) {
        resultLabel.text = @"success";
        resultLabel.textColor = [UIColor greenColor];
    } else {
        resultLabel.text = @"failed";
        resultLabel.textColor = [UIColor redColor];
    }
    
    [self.portraitView addSubview:connectLabel];
    [self.portraitView addSubview:resultLabel];
}

- (void)_initLandscapeView
{
    //
    //    self.portraitImageView.contentMode = UIViewContentModeScaleAspectFit;
    //
    //    self.landscapeImageView.contentMode = UIViewContentModeScaleAspectFit;
    //
    //    // 用来判断蓝牙是否连接成功，从而决定显示成功还是失败的页面
    //    if (self.connected) {
    //        NSLog(@"成功");
    //
    //        self.landscapeImageView.image = [UIImage imageNamed:@"binggo.png"];
    //        self.portraitImageView.image = [UIImage imageNamed:@"binggo.png"];
    //
    //
    //        SCAutoresizingLabel *connectLabel = InitializeAutoLabel(0.0f, self.landscapeImageView.frame.origin.y + self.landscapeImageView.frame.size.height + 5.0f);
    //        connectLabel.center = CGPointMake(self.landscapeImageView.center.x - 60.0f, connectLabel.center.y);
    //        connectLabel.text = @"connect";
    //
    //        SCAutoresizingLabel *resultLabel = InitializeAutoLabel(connectLabel.frame.origin.x + connectLabel.frame.size.width + 10.0f, connectLabel.frame.origin.y);
    //        resultLabel.text = @"success";
    //        resultLabel.textColor = [UIColor greenColor];
    //        [self.landscapeView addSubview:connectLabel];
    //        [self.landscapeView addSubview:resultLabel];
    
    //
    //        SCAutoresizingLabel *connectLabel = InitializeAutoLabel(connectLabel.center.x, self.landscapeImageView.center.y);
    //        SCAutoresizingLabel *connectLabel = InitializeAutoLabel(connectLabel.center.x, self.landscapeImageView.center.y);
    //        [self.landscapeView addSubview:connectLabel];
    //        [self.landscapeView addSubview:connectLabel];
    
    //        SCAutoresizingLabel *connectLabel = InitializeAutoLabel(connectLabel.center.x, self.landscapeImageView.center.y);
    //        SCAutoresizingLabel *connectLabel = InitializeAutoLabel(connectLabel.center.x, self.landscapeImageView.center.y);
    //
    //        [self.landscapeView addSubview:connectLabel];
    //        [self.landscapeView addSubview:connectLabel];
    //
    //
    //        SCAutoresizingLabel *connectLabel = InitializeAutoLabel(connectLabel.center.x, self.landscapeImageView.center.y);
    //        SCAutoresizingLabel *connectLabel = InitializeAutoLabel(connectLabel.center.x, self.landscapeImageView.center.y);
    //        [self.landscapeView addSubview:connectLabel];
    //        [self.landscapeView addSubview:connectLabel];
    //    }
    
    
    // 根据成功还是失败的页面来决定，下个页面跳转到那个页

}

- (void)_GoToMapSelected
{
    MapSelectedViewController *mapSelectedViewCtrl = [[MapSelectedViewController alloc] initWithNibName:@"MapSelectedViewController" bundle:nil];
    [self.navigationController pushViewController:mapSelectedViewCtrl animated:YES];
}

- (void)_GoToConnectivity
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
