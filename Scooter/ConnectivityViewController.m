//
//  ConnectivityViewController.m
//  Scooter
//
//  Created by xingyanl on 3/23/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "ConnectivityViewController.h"
#import "ResultViewController.h"

@interface ConnectivityViewController ()
// 私有属性
// 中心管理
@property CBCentralManager *centralManager;
// 连接状态
@property ConnectionState state;
// 当前周边
@property UARTPeripheral *currentPeripheral;

//Private methods
- (void)_initView;
- (void)_initPortraitView;
- (void)_initLandscapeView;
@end

@implementation ConnectivityViewController

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
    // 创建一个中央对象
    _centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
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

// 用来决定蓝牙是否连接成功
- (BOOL)isConnected
{
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)
toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self setOrientationView:toInterfaceOrientation duration:duration portraitView:self.portraitView landscapeView:self.landscapeView];
}

#pragma mark - CBCentralManagerDelegate
// 代理方法决定是否已经连接
- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    if (central.state == CBCentralManagerStatePoweredOff) {
        NSLog(@"蓝牙已经打开了");
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    
    
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    
}

#pragma mark - Action Methods
// 点击蓝牙按钮的时候进行蓝牙搜索或者是连接固定的蓝牙？？？？
- (IBAction)blueToothButtonPressed:(UIButton *)sender {
    
    /* 点击按钮的时候触发的蓝牙事件 */
    switch (_state) {
        case IDLE:
            _state = SCANNING;
            NSLog(@"开始搜索.........");
            // 搜索一个指定的服务，实际会有一个代理的方法centralManagerDidUpdateState方法，搜索周边的服务
            [_centralManager scanForPeripheralsWithServices:@[UARTPeripheral.uartServiceUUID] options:@{CBCentralManagerScanOptionAllowDuplicatesKey: [NSNumber numberWithBool:NO]}];
            break;
            
        case SCANNING:
            _state = IDLE;
            NSLog(@"停止搜索.........");
            [_centralManager stopScan];
            break;
            
        case CONNECTED:
            NSLog(@"断开周边连接......%@", _currentPeripheral.peripheral.name);
            [_centralManager cancelPeripheralConnection:_currentPeripheral.peripheral];
            break;
        
        default:
            break;
    }
    
    ResultViewController *resultViewCtrl =[[ResultViewController alloc] initWithNibName:@"ResultViewController" bundle:nil];
    
    resultViewCtrl.connected = self.isConnected;
    
    [self.navigationController pushViewController:resultViewCtrl animated:YES];
}

#pragma mark - UIAlertViewDelegate Methods
- (IBAction)usbButtonPressed:(UIButton *)sender {
    UIAlertView *warning = [[UIAlertView alloc] initWithTitle:LocalizeString(@"AlertWarning") message:LocalizeString(@"AlertContent") delegate:nil cancelButtonTitle:LocalizeString(@"Cancel") otherButtonTitles:nil];
    [warning show];

}

#pragma mark - Private Methods
- (void)_initView
{
    [self _initPortraitView];
    [self _initLandscapeView];
}

- (void)_initPortraitView
{
    _warningPortraitLabel.text = LocalizeString(@"Warning");
    [self setLabelLayer:_warningPortraitLabel];
    
    _displayPortraitLabel.text = LocalizeString(@"Connectivity");
    _displayPortraitLabel.center = CGPointMake(_warningPortraitLabel.center.x, _displayPortraitLabel.center.y);
    [self setLabelLayer:_displayPortraitLabel];

    _usbPortraitBtn.center = CGPointMake(_usbPortraitBtn.center.x, _blueToothPortraitBtn.center.y);
}

- (void)_initLandscapeView
{
    _warningLandscapeLabel.text = LocalizeString(@"Warning");
    [self setLabelLayer:_warningLandscapeLabel];

    _displayLandscapeLabel.text = LocalizeString(@"Connectivity");
    _displayLandscapeLabel.center = CGPointMake(_warningLandscapeLabel.center.x, _displayLandscapeLabel.center.y);
    [self setLabelLayer:_displayLandscapeLabel];

    _usbLandscapeBtn.center = CGPointMake(_usbLandscapeBtn.center.x, _blueToothLandscapeBtn.center.y);
}

@end
