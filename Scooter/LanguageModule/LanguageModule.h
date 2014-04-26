//
//  LanguageModule.h
//  mbank
//
//  Created by kemm on 5/15/12.
//  Copyright (c) 2012 CIeNET. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModuleProtocol.h"

@class ModuleFramework;

@interface LanguageModule : NSObject<ModuleProtocol> {
@private
	ModuleManagementFramework *moduleManagementFrameworks_;
}

@property (nonatomic, retain) NSMutableDictionary *languageProfileDic;
@property (nonatomic, retain) NSDictionary *curLanguageDic;

//初始化业务模块
- (void)initModule:(ModuleInfo *)info;

//调用业务模块功能处理
- (int)callModuleProcess:(int)capabilityId withInParam:(id)inParam andOutParam:(id *)outParam;

@end
