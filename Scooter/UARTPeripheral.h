//
//  UARTPeripheral.h
//  nRF UART
//  Test git
//  Created by Ole Morten on 1/12/13.
//  Copyright (c) 2013 Nordic Semiconductor. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义了一个周围的代理，他需要找到一个实现这个代理的类，来完成接受数据和获取硬件信息这两个事情，周围即是服务器端
@protocol UARTPeripheralDelegate

// 接受数据
- (void) didReceiveData:(NSString *) string;

// 获得硬件的信息
@optional
- (void) didReadHardwareRevisionString:(NSString *) string;

@end

// 实现了周边的代理，即CBPeripheralDelegate,这个周边代理

@interface UARTPeripheral : NSObject <CBPeripheralDelegate>
// 定义一个周边
@property CBPeripheral *peripheral;

// 实现一个代理
@property id<UARTPeripheralDelegate> delegate;

// 周边的服务的id，应该还有一个周边的特征的uuid
+ (CBUUID *) uartServiceUUID;

// 初始化周边的信息
- (UARTPeripheral *) initWithPeripheral:(CBPeripheral*)peripheral delegate:(id<UARTPeripheralDelegate>) delegate;
// 写数据
- (void) writeString:(NSString *) string;

// 连接和断开连接的方法
- (void) didConnect;
- (void) didDisconnect;

@end
