//
//  ModuleTypeDef.h
//  Scooter
//
//  Created by xingyanl on 14-3-31.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

//由业务模块id与相应模块的某个能力id组合成一个唯一的业务调用id
//32位业务调用id = 模块id（高16位）＋ 能力id（低16位）
#define MakeID(x, y) (((x)<<16) + (y))

//从32位业务调用id中分离模块id
#define ModuleID(x) ((x)>>16)

//从32位业务调用id中分离能力id
#define CapabilityID(x) (((x)<<16)>>16)

//业务模块ID定义
enum TModuleID {
	//多语言管理模块
	ELanguageManager = 1,
    
    //电车蓝牙模块
    EScooterManager,
};

//多语言管理模块提供的业务功能
enum TLanguageManagerCapability {
	//获取字符串资源
	EGetText = 1,
	
	//获取当前使用语言
	EGetCurrentLanguage,
    
    //获取可用的语言项列表，例如中文和英文
    EGetAvailableLanguageList,
    
	//改变当前语言配置
	EChangeLanguage,
    
    //当语言模块加载完最新配置后会广播语言已经改变的通知
	ELanguageChangeNotify,
};

//多语言
enum TLanguages {
	// 中文
    EChinese = 0,
    
    // 英文
    EEnglish,
    
    // 德语
    EGeman,
    
    // 荷兰语
    EDutch,
    
    //西班牙
    ESpanish,
};
