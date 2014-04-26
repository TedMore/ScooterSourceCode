//////////////////////////////////////////////////////////////////////////  
///                         COPYRIGHT NOTICE  
///
/// Copyright (c) 2011, CIeNET Technologies  
/// All rights reserved.  
///  
/// @file  Common.h
/// @brief  全局公用的接口函数.
///  
///  
///  
/// @version 1.0.0     
/// @author  Poseidon         
/// @date    2012.02.15               
///  
///  
/// 
//////////////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ConstantDef.h"


#define LocalizeString(text)				([Common getTextByTag:text])
#define ChangeLocalizeString(text)          ([Common changeLanguage:text])

@interface Common : NSObject {
    
}

/**********************************************************
 Language Handle Interface
 **********************************************************/
//获取系统当前使用语言
+ (int) getCurrentSystemLanguage;

//获取当前使用语言
+ (NSString*) getCurrentLanguage;

//获取当前可用的语言列表
+ (NSArray*)getAvailableLanguageList;

//改变当前语言设置
+ (void)changeLanguage:(NSString*)language;

//获取当前语言下的字符串
+ (NSString*)getTextByTag:(NSString*)tag;




@end
