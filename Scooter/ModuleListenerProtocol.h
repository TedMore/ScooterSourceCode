//
//  ModuleProtocol.h
//  Scooter
//
//  Created by xingyanl on 14-3-31.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import <Foundation/Foundation.h>

//业务事件监听协议接口
@protocol ModuleListenerProtocol 

- (void)processModuleNotify:(int)notifcationId withInParam:(id)inParam;

@end
