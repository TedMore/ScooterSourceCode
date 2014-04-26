//
//  Common.m
//  VoIP_iPhone
//
//  Created by jimmyxu on 11-4-19.
//  Copyright 2011年 Cienet. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "Common.h"
#import "ModuleManagementFramework.h"
#import "ModuleDef.h"
#import "AppDelegate.h"

@implementation Common

//获取系统当前语言
+ (int) getCurrentSystemLanguage {
    //获取系统语言
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];		
    NSArray* languages = [defaults objectForKey:APPLELANGUAGE];
    NSString* systemLan = [languages objectAtIndex:0];
    //判断并获取当前语言字符串
    if ([systemLan isEqualToString: ksChinesesimplifiedFont]) {
        return ESystemLanguageCH;
    } else {
        return ESystemLanguageEN;
    } 
}

+ (NSString*) getCurrentLanguage {
	NSString* string = nil;
    [[ModuleManagementFramework defaultModuleManagementFramework] 
	 callModuleProcess:MakeID(ELanguageManager, EGetCurrentLanguage) 
	 withInParam:nil 
	 andOutParam:&string];
    if ([string isEqualToString:@"System"]) {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];		
        NSArray* languages = [defaults objectForKey:APPLELANGUAGE];
        NSString* systemLan = [languages objectAtIndex:0];
        if (![systemLan compare:ksChinesesimplifiedFont]||![systemLan compare:ksChineseTraditionFont]){
            string = CHINESE;
        } else {
            string = ENGLISH;
        }
    }
    return string;
}

//获取当前可用的语言列表
+ (NSArray*)getAvailableLanguageList {
	
	NSMutableArray* lanList = [NSMutableArray arrayWithCapacity:10];
	
    [[ModuleManagementFramework defaultModuleManagementFramework]
	 callModuleProcess:MakeID(ELanguageManager, EGetAvailableLanguageList) 
	 withInParam:nil 
	 andOutParam:&lanList];
    
    return lanList;
	
}

//改变当前语言设置
+ (void)changeLanguage:(NSString*)language {
    [[ModuleManagementFramework defaultModuleManagementFramework] 
	 callModuleProcess:MakeID(ELanguageManager, EChangeLanguage) 
	 withInParam:language 
	 andOutParam:nil];
}

//获取当前语言下的字符串
+ (NSString*)getTextByTag:(NSString*)tag {
	NSMutableString* string = [NSMutableString stringWithString:kNullString];
	[[ModuleManagementFramework defaultModuleManagementFramework] 
	 callModuleProcess:MakeID(ELanguageManager, EGetText) 
	 withInParam:tag 
	 andOutParam:&string];
    return string;
}

@end