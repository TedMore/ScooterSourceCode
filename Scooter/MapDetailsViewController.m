//
//  MapDetailsViewController.m
//  ScooterTest
//
//  Created by xingyanl on 3/24/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "MapDetailsViewController.h"
#import "SCAutoresizingLabel.h"

#define LANDSCAPEOFFSET 10.0f  // 横屏偏移
#define XLANDSCAPELOCATE 100.0f  // 横屏X位置
#define YLANDSCAPELOCATE 190.0f // 横屏Y位置

#define PORTRAITOFFSET 5.0f  // 竖屏偏移
#define XPORTRAITLOCATE 35.0f  // 竖屏X位置
#define YPORTRAITLOCATE 317.0f // 竖屏Y位置

#define RECTANGLEHEIGHT 37.0f // 矩形宽度
#define TOPEDGE         55.0f // 离矩形底部的距离

@interface MapDetailsViewController ()

- (void)_initView;
- (void)_initPortraitBottomView;
- (void)_initLandscapeBottomView;
- (void)_initPortraitView;
- (void)_initLandscapeView;

@end

@implementation MapDetailsViewController

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
// 是否需要定义一个代理方法，来处理一些事情，比如根据当前的屏幕状态来决定返回的屏幕时横评，还是竖屏
- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backRootButtonPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//

#pragma mark - Private Methods
- (void)_initView
{
    // 判断当前的设备的方向
    [self _initPortraitView];
    [self _initLandscapeView];
}

- (void)_initPortraitView
{
    // 竖屏元素,不显示，到底是哪里的问题, 元素没传递过来值？
    SCAutoresizingLabel *speedPortraitLabel = InitializeAutoLabel(XPORTRAITLOCATE, YPORTRAITLOCATE);
    speedPortraitLabel.text = LocalizeString(@"MaxSpeed");

    SCAutoresizingLabel *rangePortraitLabel = InitializeAutoLabel(speedPortraitLabel.frame.origin.x + speedPortraitLabel.frame.size.width + PORTRAITOFFSET, YPORTRAITLOCATE);
    rangePortraitLabel.text = LocalizeString(@"MaxRange");

    SCAutoresizingLabel *dcVoltagePortraitLabel = InitializeAutoLabel(rangePortraitLabel.frame.origin.x + rangePortraitLabel.frame.size.width + PORTRAITOFFSET, YPORTRAITLOCATE);
    dcVoltagePortraitLabel.text = LocalizeString(@"DcVoltage");

    SCAutoresizingLabel *amVoltagePortraitLabel = InitializeAutoLabel(dcVoltagePortraitLabel.frame.origin.x + dcVoltagePortraitLabel.frame.size.width + PORTRAITOFFSET, YPORTRAITLOCATE);
    amVoltagePortraitLabel.text = LocalizeString(@"AnVoltage");

    // 定义各个矩形的高度
    int speedHeight = [[self.valueArray objectAtIndex:0] intValue];
    int rangeHeight = [[self.valueArray objectAtIndex:1] intValue];
    int dcVoltageHeight = [[self.valueArray objectAtIndex:2] intValue];
    int amVoltageHeight = rangeHeight + dcVoltageHeight / 4;
    
    // 竖屏显示的矩形
    CGRect speedPortrait = CGRectMake(0, speedPortraitLabel.frame.origin.y + LANDSCAPEOFFSET - speedHeight, RECTANGLEHEIGHT, speedHeight - 2*LANDSCAPEOFFSET);
    CGRect rangePortrait = CGRectMake(0, rangePortraitLabel.frame.origin.y + LANDSCAPEOFFSET - rangeHeight, RECTANGLEHEIGHT, rangeHeight - 2*LANDSCAPEOFFSET);
    CGRect dcVoltagePortrait = CGRectMake(0, dcVoltagePortraitLabel.frame.origin.y + LANDSCAPEOFFSET - dcVoltageHeight, RECTANGLEHEIGHT, dcVoltageHeight - 2*LANDSCAPEOFFSET);
    CGRect amVoltagePortrait = CGRectMake(0, amVoltagePortraitLabel.frame.origin.y + LANDSCAPEOFFSET - amVoltageHeight, RECTANGLEHEIGHT , amVoltageHeight - 2*LANDSCAPEOFFSET);
    
    UIRectangle *speedRectangle = UIDrawRectangle(speedPortrait, speedHeight - TOPEDGE);
    speedRectangle.center = CGPointMake(speedPortraitLabel.center.x, speedRectangle.center.y);
    speedRectangle.text = [NSString stringWithFormat:@"%d", speedHeight];
    speedRectangle.backgroundColor = SpeedColor;
    
    UIRectangle *rangeRectangle = UIDrawRectangle(rangePortrait, (rangeHeight - TOPEDGE));
    rangeRectangle.center = CGPointMake(rangePortraitLabel.center.x, rangeRectangle.center.y);
    rangeRectangle.text = [NSString stringWithFormat:@"%d", rangeHeight];
    rangeRectangle.backgroundColor = RangeColor;
    
    UIRectangle *dcVoltageRectangle = UIDrawRectangle(dcVoltagePortrait, (dcVoltageHeight - TOPEDGE) ? (dcVoltageHeight - TOPEDGE) : 0);
    dcVoltageRectangle.center = CGPointMake(dcVoltagePortraitLabel.center.x, dcVoltageRectangle.center.y);
    dcVoltageRectangle.text = [NSString stringWithFormat:@"%d", dcVoltageHeight];
    dcVoltageRectangle.backgroundColor = DcVoltageColor;
    
    UIRectangle *amVoltageRectangle = UIDrawRectangle(amVoltagePortrait, (amVoltageHeight - TOPEDGE));
    amVoltageRectangle.center = CGPointMake(amVoltagePortraitLabel.center.x, amVoltageRectangle.center.y);
    amVoltageRectangle.text = [NSString stringWithFormat:@"%d", amVoltageHeight];
    amVoltageRectangle.backgroundColor = AmVoltageColor;

    // 标签
    [self.portraitView addSubview:speedPortraitLabel];
    [self.portraitView addSubview:rangePortraitLabel];
    [self.portraitView addSubview:dcVoltagePortraitLabel];
    [self.portraitView addSubview:amVoltagePortraitLabel];
    
    // 矩形
    [self.portraitView addSubview:speedRectangle];
    [self.portraitView addSubview:rangeRectangle];
    [self.portraitView addSubview:dcVoltageRectangle];
    [self.portraitView addSubview:amVoltageRectangle];
    
    [self _initPortraitBottomView];
}

- (void)_initLandscapeView
{
    // 横屏元素, 各个label的位置
    SCAutoresizingLabel *speedLandscapeLabel = InitializeAutoLabel(XLANDSCAPELOCATE, YLANDSCAPELOCATE);
    speedLandscapeLabel.text = LocalizeString(@"MaxSpeed");

    SCAutoresizingLabel *rangeLandscapeLabel = InitializeAutoLabel(speedLandscapeLabel.frame.origin.x + speedLandscapeLabel.frame.size.width + LANDSCAPEOFFSET, YLANDSCAPELOCATE);
    rangeLandscapeLabel.text = LocalizeString(@"MaxRange");
    
    SCAutoresizingLabel *dcVoltageLandscapeLabel = InitializeAutoLabel(rangeLandscapeLabel.frame.origin.x + rangeLandscapeLabel.frame.size.width + LANDSCAPEOFFSET, YLANDSCAPELOCATE);
    dcVoltageLandscapeLabel.text = LocalizeString(@"DcVoltage");
    
    SCAutoresizingLabel *amVoltageLandscapeLabel = InitializeAutoLabel(dcVoltageLandscapeLabel.frame.origin.x + dcVoltageLandscapeLabel.frame.size.width + LANDSCAPEOFFSET, YLANDSCAPELOCATE);
    amVoltageLandscapeLabel.text = LocalizeString(@"AnVoltage");
    
    // 定义各个矩形的高度
    int speedHeight = [[self.valueArray objectAtIndex:0] intValue];
    int rangeHeight = [[self.valueArray objectAtIndex:1] intValue];
    int dcVoltageHeight = [[self.valueArray objectAtIndex:2] intValue];
    int amVoltageHeight = rangeHeight + dcVoltageHeight / 4;
    
    // 横屏显示的矩形
    CGRect speedLandscape = CGRectMake(0, speedLandscapeLabel.frame.origin.y + LANDSCAPEOFFSET - speedHeight, RECTANGLEHEIGHT, speedHeight - 2*LANDSCAPEOFFSET);
    CGRect rangeLandscape = CGRectMake(0, rangeLandscapeLabel.frame.origin.y + LANDSCAPEOFFSET - rangeHeight, RECTANGLEHEIGHT, rangeHeight - 2*LANDSCAPEOFFSET);
    CGRect dcVoltageLandscape = CGRectMake(0, dcVoltageLandscapeLabel.frame.origin.y + LANDSCAPEOFFSET - dcVoltageHeight, RECTANGLEHEIGHT, dcVoltageHeight - 2*LANDSCAPEOFFSET);
    CGRect amVoltageLandscape = CGRectMake(0, amVoltageLandscapeLabel.frame.origin.y + LANDSCAPEOFFSET - amVoltageHeight, RECTANGLEHEIGHT , amVoltageHeight - 2*LANDSCAPEOFFSET);
    
    UIRectangle *speedLandscapeRectangle = UIDrawRectangle(speedLandscape, speedHeight - TOPEDGE);
    speedLandscapeRectangle.center = CGPointMake(speedLandscapeLabel.center.x, speedLandscapeRectangle.center.y);
    speedLandscapeRectangle.text = [NSString stringWithFormat:@"%d", speedHeight];
    speedLandscapeRectangle.backgroundColor = SpeedColor;
    
    UIRectangle *rangeLandscapeRectangle = UIDrawRectangle(rangeLandscape, (rangeHeight - TOPEDGE));
    rangeLandscapeRectangle.center = CGPointMake(rangeLandscapeLabel.center.x, rangeLandscapeRectangle.center.y);
    rangeLandscapeRectangle.text = [NSString stringWithFormat:@"%d", rangeHeight];
    rangeLandscapeRectangle.backgroundColor = RangeColor;
    
    UIRectangle *dcVoltageLandscapeRectangle = UIDrawRectangle(dcVoltageLandscape, (dcVoltageHeight - TOPEDGE) ? (dcVoltageHeight - TOPEDGE) : 0);
    dcVoltageLandscapeRectangle.center = CGPointMake(dcVoltageLandscapeLabel.center.x, dcVoltageLandscapeRectangle.center.y);
    dcVoltageLandscapeRectangle.text = [NSString stringWithFormat:@"%d", dcVoltageHeight];
    dcVoltageLandscapeRectangle.backgroundColor = DcVoltageColor;
    
    UIRectangle *amVoltageLandscapeRectangle = UIDrawRectangle(amVoltageLandscape, (amVoltageHeight - TOPEDGE));
    amVoltageLandscapeRectangle.center = CGPointMake(amVoltageLandscapeLabel.center.x, amVoltageLandscapeRectangle.center.y);
    amVoltageLandscapeRectangle.text = [NSString stringWithFormat:@"%d", amVoltageHeight];
    amVoltageLandscapeRectangle.backgroundColor = AmVoltageColor;

    
    [self.landscapeView addSubview:speedLandscapeLabel];
    [self.landscapeView addSubview:rangeLandscapeLabel];
    [self.landscapeView addSubview:dcVoltageLandscapeLabel];
    [self.landscapeView addSubview:amVoltageLandscapeLabel];
    
    [self.landscapeView addSubview:speedLandscapeRectangle];
    [self.landscapeView addSubview:rangeLandscapeRectangle];
    [self.landscapeView addSubview:dcVoltageLandscapeRectangle];
    [self.landscapeView addSubview:amVoltageLandscapeRectangle];
    
    [self _initLandscapeBottomView];
}

// 之所以没有显示是因为数值没有传过来
- (void)_initPortraitBottomView
{
    UIView *displayView = [[UIView alloc] initWithFrame:CGRectMake(_backPortraitBtn.frame.origin.x + _backPortraitBtn.frame.size.width + 10, _backPortraitBtn.frame.origin.y, 140.0f, 35.0f)];
    displayView.center = CGPointMake(displayView.center.x, _backPortraitBtn.center.y);
    
//    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_bg5.png"]];
//    [displayView setBackgroundColor:color];
    displayView.layer.borderWidth = 2;
    displayView.layer.cornerRadius = 18;
    displayView.layer.borderColor = [UIColor whiteColor].CGColor;
    displayView.backgroundColor = BackgroundColor;
    
    // Label里面不可以有真实的数字，用宏定义代替，颜色进行区分
    SCAutoresizingLabel *leftLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(24.0f, 8.0f, 0, 0)];
    leftLabel.backgroundColor = [UIColor clearColor];
    leftLabel.textColor = [UIColor whiteColor];
    leftLabel.text = _leftValue;
    NSLog(@"Thel leftValue is %@", _leftValue);

    UIImageView *midImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_midValue]];
    midImageView.frame = CGRectMake(leftLabel.frame.origin.x + leftLabel.frame.size.width + 5.0f, 5.0f, midImageView.frame.size.width, midImageView.frame.size.height);
    
    SCAutoresizingLabel *rightLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(leftLabel.frame.size.width + midImageView.frame.size.width + 35.0f, 8.0f, 0, 0)];
    rightLabel.backgroundColor = [UIColor clearColor];
    rightLabel.textColor = [UIColor whiteColor];
    rightLabel.text = _rightValue;
    
    
    [displayView addSubview:leftLabel];
    [displayView addSubview:midImageView];
    [displayView addSubview:rightLabel];
    
    [self.portraitView addSubview:displayView];
}

- (void)_initLandscapeBottomView
{
    // Label里面不可以有真实的数字，用宏定义代替，颜色进行区分
    UIView *displayView = [[UIView alloc] initWithFrame:CGRectMake(_backLandscapeBtn.frame.origin.x + _backLandscapeBtn.frame.size.width + 10, 100.0f, 187.0f, 35.0f)];
    displayView.center = CGPointMake(displayView.center.x, _backLandscapeBtn.center.y);
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_bg5.png"]];
    [displayView setBackgroundColor:color];
    
    SCAutoresizingLabel *leftLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(24.0f, 8.0f, 0, 0)];
    leftLabel.backgroundColor = [UIColor clearColor];
    leftLabel.textColor = [UIColor whiteColor];
    leftLabel.text = _leftValue;
    
    UIImageView *midImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_midValue]];
    midImageView.frame = CGRectMake(leftLabel.frame.origin.x + leftLabel.frame.size.width + 5.0f, 5.0f, midImageView.frame.size.width, midImageView.frame.size.height);
    
    SCAutoresizingLabel *rightLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(leftLabel.frame.size.width + midImageView.frame.size.width + 35.0f, 8.0f, 0, 0)];
    rightLabel.backgroundColor = [UIColor clearColor];
    rightLabel.textColor = [UIColor whiteColor];
    rightLabel.text = _rightValue;
    
    
    [displayView addSubview:leftLabel];
    [displayView addSubview:midImageView];
    [displayView addSubview:rightLabel];
    
    [self.landscapeView addSubview:displayView];
}

@end
