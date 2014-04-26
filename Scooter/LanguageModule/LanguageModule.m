//
//  LanguageModule.m
//  mbank
//
//  Created by kemm on 5/15/12.
//  Copyright (c) 2012 CIeNET. All rights reserved.
//
#import "LanguageModule.h"
#import "ModuleDef.h"
#import "ModuleManagementFramework.h"
#import "ConstantDef.h"

//定义类的私有成员方法
@interface LanguageModule(private)

//加载语言文件
- (void)loadLanguageProfile;
//存储语言文件
- (void)restoreLanguageProfile;
//得到文本函数
- (int) getTextWithInParam:(id)inParam andOutParam:(id)outParam;
//改变语言函数
- (int) changeLanguageWithInParam:(id)inParam andOutParam:(id)outParam;
//得到当前语言函数
- (int) getCurrentLanguageWithInParam:(id)inParam andOutParam:(id)outParam;
//得到当前语言列表函数
- (int) getAvailableLanguageListWithInParam:(id)inParam andOutParam:(id)outParam;

@end

@implementation LanguageModule

@synthesize languageProfileDic = languageProfileDic_;
@synthesize curLanguageDic = curLanguageDic_;

/**
 * @brief 类的初始化，构造函数
 *
 * Detailed comments of this function
 * @param [in]  nil
 * @param [out] nil
 * @return     void
 * @note
 */
- (id)init {
    self = [super init];
    return self;
}

/**
 * @brief 类的析构函数
 *
 * Detailed comments of this function
 * @param [in]  nil
 * @param [out] nil
 * @return     void
 * @note
 */
- (void)dealloc {
    [self restoreLanguageProfile];
}

/**
 * @brief 初始化业务模块
 *
 * Detailed comments of this function
 * @param [in]  ModuleInfo *
 * @param [out] 
 * @return     int
 * @note
 */
- (void)initModule:(ModuleInfo *)info {
    info.moduleId = ELanguageManager;
    moduleManagementFrameworks_ = info.moduleManagementFramework;
    [self loadLanguageProfile];
}

/**
 * @brief 调用业务模块功能处理
 *
 * Detailed comments of this function
 * @param [in]  int  id  id *
 * @param [out] nil
 * @return     int
 * @note
 */
- (int)callModuleProcess:(int)capabilityId withInParam:(id)inParam andOutParam:(id *)outParam {
    switch(capabilityId){
        case EGetText:
		{
            return [self getTextWithInParam:inParam andOutParam:*outParam];
        }
        case EChangeLanguage:
		{
            return [self changeLanguageWithInParam:inParam andOutParam:nil];
        } 
		case EGetCurrentLanguage:
		{
			return [self getCurrentLanguageWithInParam:inParam andOutParam:*outParam];
		}
		case EGetAvailableLanguageList:
		{
			return [self getAvailableLanguageListWithInParam:inParam andOutParam:*outParam];
		}
        default:
		{
            break;
        }
    }
    return 0;
}

/**
 * @brief 得到文本函数
 *
 * Detailed comments of this function
 * @param [in]  id id
 * @param [out] nil
 * @return   int
 * @note MobileBank/AccountGeneral/Title
 */
- (int)getTextWithInParam:(id)inParam andOutParam:(id)outParam {
	NSString *tag = (NSString*)inParam;
	NSString *text = kNullString;
	NSArray* array = [tag componentsSeparatedByString:@"/"];
	NSDictionary* dic = self.curLanguageDic;
	for (NSInteger i = 0; i < [array count]; ++i) {
		id object = [dic objectForKey:[array objectAtIndex:i]];
		if ([object isKindOfClass:[NSString class]]){
			text = object;
		}
		else if ([object isKindOfClass:[NSDictionary class]]) {
			dic = (NSDictionary*)object;
		}
	}
	NSMutableString *string = (NSMutableString *)outParam;
	[string setString:text];
    return 0;
}

/**
 * @brief 改变语言函数
 *
 * Detailed comments of this function
 * @param [in]  id  id
 * @param [out] nil
 * @return    int
 * @note
 */
- (int)changeLanguageWithInParam:(id)inParam andOutParam:(id)outParam {
	//获得要改变语言的种类：中文或英文
	NSString *changeLanguageFlag = (NSString*)inParam;
	//获得当前配置文件路径
    changeLanguageFlag = [NSString stringWithFormat:@"%@.plist", changeLanguageFlag];
    
    NSLog(@"%@", changeLanguageFlag);
    
	NSString *currentLanguageFilePath = [[[NSBundle mainBundle] resourcePath] 	stringByAppendingPathComponent:changeLanguageFlag];
	//获得数据字典
	self.curLanguageDic = [[NSMutableDictionary alloc] initWithContentsOfFile:currentLanguageFilePath];
    
	NSString* languageProfile = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:LANGUAGEPROFILE];
    
	//把更改后的写入文件
	[self.languageProfileDic setObject:changeLanguageFlag forKey:CURRENTLANGUAGEFLAG];
	[self.languageProfileDic writeToFile:languageProfile atomically:YES];
    
    //当新配置的语言加载完成则广播通知
    [moduleManagementFrameworks_ broadcastModuleNotify:MakeID(ELanguageManager, ELanguageChangeNotify) withInParam:inParam];
    return 0;
}

/**
 * @brief 得到当前语言函数
 *
 * Detailed comments of this function
 * @param [in]  id  id
 * @param [out] nil
 * @return     int
 * @note
 */
- (int)getCurrentLanguageWithInParam:(id)inParam andOutParam:(id)outParam {
	NSMutableString* currentLang = (NSMutableString*)outParam;
	currentLang = [self.languageProfileDic objectForKey:CURRENTLANGUAGEFLAG];
   	return 0;
}

/**
 * @brief 得到语言列表函数
 *
 * Detailed comments of this function
 * @param [in]  id  id *
 * @param [out] nil
 * @return     int
 * @note
 */
- (int)getAvailableLanguageListWithInParam:(id)inParam andOutParam:(id)outParam {
	NSMutableArray* availableLanList = (NSMutableArray*)outParam;
	[availableLanList addObjectsFromArray:[[self.languageProfileDic objectForKey:AVAILABLELANGUAGEFLAG] allKeys]];
	return 0;
}

/**
 * @brief 程序启动，初始化加载语言函数
 *
 * Detailed comments of this function
 * @param [in]  nil
 * @param [out] nil
 * @return     void
 * @note
 */
- (void)loadLanguageProfile {
    //获取当前语言配置的路径
	NSString *languageProfile = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:LANGUAGEPROFILE];
	//取得语言数据
    self.languageProfileDic = [[NSMutableDictionary alloc] initWithContentsOfFile:languageProfile];
    // 获得当前默认的语言
    NSString *lang = CURRENTLANGUAGEFLAG;
//    NSLog(@"%@", CURRENTLANGUAGEFLAG);
    
    if ([lang isEqualToString:@"System"]) {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];		
        NSArray* languages = [defaults objectForKey:APPLELANGUAGE];
        NSString* systemLan = [languages objectAtIndex:0];
        //判断并获取当前语言字符串
        if(![systemLan compare:ksChinesesimplifiedFont]||![systemLan compare:ksChineseTraditionFont]){
            lang = CHINESE;
        } else {
            lang = ENGLISH;
        }
    }
    
    lang = [NSString stringWithFormat:@"%@.plist",lang];
	NSString* currentLanguageFilePath = [[[NSBundle mainBundle] resourcePath] 
											stringByAppendingPathComponent:lang];
    NSLog(@"%@", lang);
	self.curLanguageDic = [[NSMutableDictionary alloc] initWithContentsOfFile:currentLanguageFilePath];
}

/**
 * @brief 存储语言文件
 *
 * Detailed comments of this function
 * @param [in]  nil
 * @param [out] nil
 * @return     void
 * @note
 */
- (void)restoreLanguageProfile {
	NSString* languageProfile = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:LANGUAGEPROFILE];
	[self.languageProfileDic writeToFile:languageProfile atomically:YES];	
	self.languageProfileDic = nil;
	self.curLanguageDic = nil;
}

/**
 * @brief 业务模块处理
 *
 * Detailed comments of this function
 * @param [in]  int id id *
 * @param [out] nil
 * @return    int
 * @note
 */
- (int)callModuleDataProcess:(int)capabilityId withInParam:(id)inParam andOutParam:(id *)outParam {
    return 0;
}

@end
