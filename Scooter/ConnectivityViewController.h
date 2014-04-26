//
//  ConnectivityViewController.h
//  Scooter
//
//  Created by xingyanl on 3/23/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "UIBaseViewController.h"
#import "UARTPeripheral.h"

// 实现中心管理代理
@interface ConnectivityViewController : UIBaseViewController <UIAlertViewDelegate, CBCentralManagerDelegate, UARTPeripheralDelegate>


// 定义一个bool类型的用来决定蓝牙连接是否成功
@property (nonatomic, getter = isConnected) BOOL connecting;

// 定义竖屏元素
@property (strong, nonatomic) IBOutlet UIView *portraitView;
@property (strong, nonatomic) IBOutlet UIButton *blueToothPortraitBtn;
@property (strong, nonatomic) IBOutlet UIButton *usbPortraitBtn;
@property (strong, nonatomic) IBOutlet UILabel *warningPortraitLabel;
@property (strong, nonatomic) IBOutlet UILabel *displayPortraitLabel;


// 定义横评元素
@property (strong, nonatomic) IBOutlet UIView *landscapeView;
@property (strong, nonatomic) IBOutlet UIButton *blueToothLandscapeBtn;
@property (strong, nonatomic) IBOutlet UIButton *usbLandscapeBtn;
@property (strong, nonatomic) IBOutlet UILabel *warningLandscapeLabel;
@property (strong, nonatomic) IBOutlet UILabel *displayLandscapeLabel;


- (IBAction)blueToothButtonPressed:(id)sender;
- (IBAction)usbButtonPressed:(id)sender;

@end
