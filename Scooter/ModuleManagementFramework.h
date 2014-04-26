//
//  ModuleProtocol.h
//  Scooter
//
//  Created by xingyanl on 14-3-31.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ModuleListenerProtocol.h"
#import "ModuleProtocol.h"

//业务框架，用于分发业务事件和获取业务数据
@interface ModuleManagementFramework : NSObject {
    
 @private
    
    NSMutableDictionary* moduleDict_;
    NSMutableArray* moduleListenerArray_;
    
}

//获取默认的业务框架句柄
+ (id)defaultModuleManagementFramework;

//释放业务框架资源
+ (void)releaseDefaultModuleManagementFramework;

//初始化
- (id)init;

//注册业务模块
- (void)registerModule:(id<ModuleProtocol>) Module;

//注册业务事件监听对象
- (void)registerModuleListener:(id<ModuleListenerProtocol>) moduleListener;

//取消某个业务事件监听对象
- (void)unregisterModuleListener:(id<ModuleListenerProtocol>)moduleListener;

//在所有业务事件监听对象上广播业务通知
- (void)broadcastModuleNotify:(int)notifcationId withInParam:(id)inParam;

//调用具体某个业务处理，需要返回输出参数
- (int)callModuleProcess:(int)funcId withInParam:(id)inParam andOutParam:(id*)outParam;

//调用具体某个业务处理，不需要返回输出参数
- (int)callModuleProcess:(int)funcId withInParam:(id)inParam;

@end
