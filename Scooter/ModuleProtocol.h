//
//  ModuleProtocol
//  Scooter
//
//  Created by xingyanl on 14-3-31.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ModuleInfo.h"

//业务模块协议接口
@protocol ModuleProtocol

//初始化业务模块
- (void)initModule:(ModuleInfo *)info;

//调用业务模块功能处理
- (int)callModuleProcess:(int)capabilityId withInParam:(id)inParam andOutParam:(id*)outParam;

@optional

- (int)callModuleDataProcess:(int)capabilityId withInParam:(id)inParam andOutParam:(id*)outParam;

@end
