//
//  ModuleProtocol.h
//  Scooter
//
//  Created by xingyanl on 14-3-31.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCAutoresizingLabel.h"
#import "Common.h"

#define REFRESHVIEW  @"refreshView"

#define BackgroundColor		[UIColor colorWithRed:0x33/255.0 green:0x2c/255.0 blue:0x2b/255.0 alpha:1.0]
#define SpeedColor          [UIColor colorWithRed:0xa2/255.0 green:0xe9/255.0 blue:1.0 alpha:1.0]
#define RangeColor          [UIColor colorWithRed:0xf0/255.0 green:0x85/255.0 blue:0x19/255.0 alpha:1.0]
#define DcVoltageColor      [UIColor colorWithRed:0xa6/255.0 green:0xd4/255.0 blue:0xae/255.0 alpha:1.0]
#define AmVoltageColor      [UIColor colorWithRed:0xf9/255.0 green:0xbf/255.0 blue:0x00/255.0 alpha:1.0]

typedef enum
{
    IDLE = 0,
    SCANNING,
    CONNECTED,
} ConnectionState;

typedef enum
{
    LOGGING = 0,
    RX,
    TX,
} ConsoleDataType;

@interface UIBaseViewController : UIViewController

- (void)setLabelLayer:(UILabel *)label;
// 判断当前的设备的方向来决定使用横屏还是竖屏
- (void)setPortraitView:(UIView *)pView landscapeView:(UIView *)lView;

// 旋转设备时，选择设备时用横屏还是竖屏
- (void)setOrientationView:(UIInterfaceOrientation)
toInterfaceOrientation duration:(NSTimeInterval)duration portraitView:(UIView *)pView landscapeView:(UIView *)lView;

@end
