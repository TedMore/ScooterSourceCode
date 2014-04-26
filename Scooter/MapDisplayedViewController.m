//
//  MapDisplayedViewController.m
//  Scooter
//
//  Created by xingyanl on 3/23/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "MapDetailsViewController.h"
#import "MapDisplayedViewController.h"
#import "SCAutoresizingLabel.h"

#define OFFSETX 12

@interface MapDisplayedViewController ()

- (void)_initView;
- (void)_initPortraitView;
- (void)_initLandscapeView;
- (void)_goViewDetails:(NSArray *)array leftLabelValue:(NSString *)leftString midImageValue:(NSString *)midString rightLabelValue:(NSString *)rightString;

@end

@implementation MapDisplayedViewController

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
- (IBAction)standardPressed:(id)sender {
    [self _goViewDetails:_standard leftLabelValue:@"MAP1" midImageValue:@"standard2.png" rightLabelValue:LocalizeString(@"Standard")];
    NSLog(@"The data in MapDisplayedViewController is: %@", _standard);
}

- (IBAction)climbingPressed:(id)sender {
    [self _goViewDetails:_standard leftLabelValue:@"MAP2" midImageValue:@"climbing2.png" rightLabelValue:LocalizeString(@"Climbing")];
    NSLog(@"The data is: %@", _climbing);
}

- (IBAction)economyPressed:(id)sender {
    [self _goViewDetails:_standard leftLabelValue:@"MAP3" midImageValue:@"economy2.png" rightLabelValue:LocalizeString(@"Economy")];
    NSLog(@"The data is: %@", _economy);
}

- (IBAction)sportsPressed:(id)sender {
    [self _goViewDetails:_standard leftLabelValue:@"MAP4" midImageValue:@"sports2.png" rightLabelValue:LocalizeString(@"Sports")];
    NSLog(@"The data is: %@", _sports);
}

- (IBAction)highwayPressed:(id)sender {
    [self _goViewDetails:_highway leftLabelValue:@"MAP5" midImageValue:@"highway2.png" rightLabelValue:LocalizeString(@"Highway")];
    NSLog(@"The data is: %@", _highway);
}

- (IBAction)displayedButtonPressed:(id)sender {
    //当点击按钮的时候需要做的事情
//    if ([self.delegate respondsToSelector:@selector(display:::)]) {
//        [self.delegate display:_speed :_rande :_volate];
//    }
    
}

#pragma mark - Private Methods
- (void)_initView
{
    // 此处数据应当是从server端接收过来的
    _standard = [[NSArray alloc] initWithObjects:@"80", @"90", @"60", nil];
    _climbing = [[NSArray alloc] initWithObjects:@"60", @"70", @"60", nil];
    _economy = [[NSArray alloc] initWithObjects:@"10", @"60", @"60", nil];
    _sports = [[NSArray alloc] initWithObjects:@"60", @"70", @"70", nil];
    _highway = [[NSArray alloc] initWithObjects:@"60", @"70", @"90", nil];
    
    [self _initPortraitView];
    [self _initLandscapeView];
}

- (void)_initPortraitView
{
    // 标签初始化
    SCAutoresizingLabel *standardPortraitLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_standardPortraitImage.frame.origin.x + _standardPortraitImage.frame.size.width + OFFSETX, 0, 0, 0)];
    standardPortraitLabel.text = LocalizeString(@"Standard");
    standardPortraitLabel.center = CGPointMake(standardPortraitLabel.center.x, _standardPortraitImage.center.y);
    [self.portraitView addSubview:standardPortraitLabel];
    
    SCAutoresizingLabel *climbingPortraitLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_climbingPortraitImage.frame.origin.x + _climbingPortraitImage.frame.size.width + OFFSETX, 0, 0, 0)];
    climbingPortraitLabel.text = LocalizeString(@"Climbing");
    climbingPortraitLabel.center = CGPointMake(climbingPortraitLabel.center.x, _climbingPortraitImage.center.y);
    [self.portraitView addSubview:climbingPortraitLabel];
    
    SCAutoresizingLabel *economyPortraitLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_economyPortraitImage.frame.origin.x + _economyPortraitImage.frame.size.width + OFFSETX, 0, 0, 0)];
    economyPortraitLabel.text = LocalizeString(@"Economy");
    economyPortraitLabel.center = CGPointMake(economyPortraitLabel.center.x, _economyPortraitImage.center.y);
    [self.portraitView addSubview:economyPortraitLabel];
    
    SCAutoresizingLabel *sportsPortraitLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_sportsPortraitImage.frame.origin.x + _sportsPortraitImage.frame.size.width + OFFSETX, 0, 0, 0)];
    sportsPortraitLabel.text = LocalizeString(@"Sports");
    sportsPortraitLabel.center = CGPointMake(sportsPortraitLabel.center.x, _sportsPortraitImage.center.y);
    [self.portraitView addSubview:sportsPortraitLabel];
    
    SCAutoresizingLabel *highwayPortraitLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_highwayPortraitImage.frame.origin.x + _highwayPortraitImage.frame.size.width + OFFSETX, 0, 0, 0)];
    highwayPortraitLabel.text = LocalizeString(@"Highway");
    highwayPortraitLabel.center = CGPointMake(highwayPortraitLabel.center.x, _highwayPortraitImage.center.y);
    [self.portraitView addSubview:highwayPortraitLabel];
    
    // 按钮初始化
    [_standardPortraitBtn setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _standardPortraitBtn.center = CGPointMake(_standardPortraitBtn.center.x, _standardPortraitImage.center.y);
    [_climbingPortraitBtn  setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _climbingPortraitBtn.center = CGPointMake(_climbingPortraitBtn.center.x, _climbingPortraitImage.center.y);
    [_economyPortraitBtn  setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _economyPortraitBtn.center = CGPointMake(_economyPortraitBtn.center.x, _economyPortraitImage.center.y);
    [_sportsPortraitBtn  setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _sportsPortraitBtn.center = CGPointMake(_sportsPortraitBtn.center.x, _sportsPortraitImage.center.y);
    [_highwayPortraitBtn  setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _highwayPortraitBtn.center = CGPointMake(_highwayPortraitBtn.center.x, _highwayPortraitImage.center.y);
    [_displayedPortraitBtn  setTitle:LocalizeString(@"Map") forState:UIControlStateNormal];
}

- (void)_initLandscapeView
{
    // 标签初始化
    SCAutoresizingLabel *standardLandscapeLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_standardLandscapeImage.frame.origin.x + _standardLandscapeImage.frame.size.width + OFFSETX, 0, 0, 0)];
    standardLandscapeLabel.text = LocalizeString(@"Standard");
    standardLandscapeLabel.center = CGPointMake(standardLandscapeLabel.center.x, _standardLandscapeImage.center.y);
    [self.landscapeView addSubview:standardLandscapeLabel];
    
    SCAutoresizingLabel *climbingLandscapeLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_climbingLandscapeImage.frame.origin.x + _climbingLandscapeImage.frame.size.width + OFFSETX, 0, 0, 0)];
    climbingLandscapeLabel.text = LocalizeString(@"Climbing");
    climbingLandscapeLabel.center = CGPointMake(climbingLandscapeLabel.center.x, _climbingLandscapeImage.center.y);
    [self.landscapeView addSubview:climbingLandscapeLabel];
    
    SCAutoresizingLabel *economyLandscapeLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_economyLandscapeImage.frame.origin.x + _economyLandscapeImage.frame.size.width + OFFSETX, 0, 0, 0)];
    economyLandscapeLabel.text = LocalizeString(@"Economy");
    economyLandscapeLabel.center = CGPointMake(economyLandscapeLabel.center.x, _economyLandscapeImage.center.y);
    [self.landscapeView addSubview:economyLandscapeLabel];
    
    SCAutoresizingLabel *sportsLandscapeLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_sportsLandscapeImage.frame.origin.x + _sportsLandscapeImage.frame.size.width + OFFSETX, 0, 0, 0)];
    sportsLandscapeLabel.text = LocalizeString(@"Sports");
    sportsLandscapeLabel.center = CGPointMake(sportsLandscapeLabel.center.x, _standardLandscapeImage.center.y);
    [self.landscapeView addSubview:sportsLandscapeLabel];
    
    SCAutoresizingLabel *highwayLandscapeLabel = [[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(_highwayLandscapeImage.frame.origin.x + _highwayLandscapeImage.frame.size.width + OFFSETX, 0, 0, 0)];
    highwayLandscapeLabel.text = LocalizeString(@"Highway");
    highwayLandscapeLabel.center = CGPointMake(highwayLandscapeLabel.center.x, _highwayLandscapeImage.center.y);
    [self.landscapeView addSubview:highwayLandscapeLabel];
    
    // 按钮初始化
    [_standardLandscapeBtn setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _standardLandscapeBtn.center = CGPointMake(_standardLandscapeBtn.center.x, _standardLandscapeImage.center.y);
    [_climbingLandscapeBtn  setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _climbingLandscapeBtn.center = CGPointMake(_climbingLandscapeBtn.center.x, _climbingLandscapeImage.center.y);
    [_economyLandscapeBtn  setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _economyLandscapeBtn.center = CGPointMake(_economyLandscapeBtn.center.x, _economyLandscapeImage.center.y);
    [_sportsLandscapeBtn  setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _sportsLandscapeBtn.center = CGPointMake(_sportsLandscapeBtn.center.x, _standardLandscapeImage.center.y);
    [_highwayLandscapeBtn  setTitle:LocalizeString(@"Detail") forState:UIControlStateNormal];
    _highwayLandscapeBtn.center = CGPointMake(_highwayLandscapeBtn.center.x, _highwayLandscapeImage.center.y);
    [_displayedLandscapeBtn  setTitle:LocalizeString(@"Map") forState:UIControlStateNormal];
}

- (void)_goViewDetails:(NSArray *)array leftLabelValue:(NSString *)leftString midImageValue:(NSString *)midString rightLabelValue:(NSString *)rightString
{
    
    MapDetailsViewController *detailsViewCtrl = [[MapDetailsViewController alloc] init];
    detailsViewCtrl.valueArray = array;
    detailsViewCtrl.leftValue = leftString;
    detailsViewCtrl.midValue = midString;
    detailsViewCtrl.rightValue = rightString;
    [self.navigationController pushViewController:detailsViewCtrl animated:YES];
}

@end
