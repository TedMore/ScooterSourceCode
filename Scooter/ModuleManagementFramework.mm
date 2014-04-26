//
//  ModuleProtocol.h
//  Scooter
//
//  Created by xingyanl on 14-3-31.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import "ModuleManagementFramework.h"
#import "ModuleTypeDef.h"
#import "ConstantDef.h"
#import "Common.h"
#include <vector>
using namespace std;


static vector<id> listenerVector;
//未广播队列容器
static vector<vector<id>*> notbroadcastlistenerVectorVec;
static ModuleManagementFramework* g_defaultFramework = nil;

@implementation ModuleManagementFramework

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
+ (id)defaultModuleManagementFramework {
    
    if (g_defaultFramework == nil) {
        
        g_defaultFramework = [[ModuleManagementFramework alloc] init];
    
    }
    
    return g_defaultFramework;

}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
+ (void)releaseDefaultModuleManagementFramework {

    if (g_defaultFramework)
    {
        g_defaultFramework = nil;
    }
}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
- (id)init {
    
    self = [super init];
    
    if (self) {
        moduleDict_ = [[NSMutableDictionary alloc] initWithCapacity:10];
        moduleListenerArray_ = [[NSMutableArray alloc] initWithCapacity:10];
    }
    
    return self;

}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
- (void)registerModule:(id<ModuleProtocol>) module {
    
    ModuleInfo* info = [[ModuleInfo alloc] init];
    info.moduleManagementFramework = self;
    [module initModule:info];
    
    [moduleDict_ setValue:module forKey:[NSString stringWithFormat:@"%d", info.moduleId]];
    NSLog(@"The moduleDict is: %@", moduleDict_);
}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
- (void)registerModuleListener:(id<ModuleListenerProtocol>) moduleListener {

    listenerVector.push_back(moduleListener);
	
	int vectorSize = notbroadcastlistenerVectorVec.size();
	
	for (int i = 0; i < vectorSize; i++) {
	
		notbroadcastlistenerVectorVec[i]->push_back(moduleListener);
	}

}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
- (void)unregisterModuleListener:(id<ModuleListenerProtocol>)moduleListener {
   //NSLog(@"unregister 0x(%x)", businessListener);

    vector<id>::iterator iter;
    
    for (iter = listenerVector.begin(); iter != listenerVector.end(); iter++) {
        
        if (*iter == moduleListener) {
            listenerVector.erase(iter);
            break;
        }
    }
	
	
	int stackSize = notbroadcastlistenerVectorVec.size();
	
	for (int i = 0; i < stackSize; i++) {
		
		vector<id>* notbroadcastlistenerVector = notbroadcastlistenerVectorVec[i];
		
		vector<id>::iterator notbroadcastlistenerVectorIter;
		
		for (notbroadcastlistenerVectorIter = notbroadcastlistenerVector->begin(); 
			 notbroadcastlistenerVectorIter != notbroadcastlistenerVector->end(); 
			 notbroadcastlistenerVectorIter++) {
			
			if (*notbroadcastlistenerVectorIter == moduleListener) {
				notbroadcastlistenerVector->erase(notbroadcastlistenerVectorIter);
				break;
			}
            
		}
	}
}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
- (void)broadcastModuleNotify:(int)notifcationId withInParam:(id)inParam {
	vector<id>* notbroadcastlistenerVector = new vector<id>(listenerVector);
	notbroadcastlistenerVectorVec.push_back(notbroadcastlistenerVector);
	
	while (notbroadcastlistenerVector->begin() != notbroadcastlistenerVector->end()) {
	
		id<ModuleListenerProtocol> listener = *notbroadcastlistenerVector->begin();
		//NSLog(@"listen 0x(%x)", listener);
		notbroadcastlistenerVector->erase(notbroadcastlistenerVector->begin());
		
		//NSLog(@"listener class %@", [listenerVector CLASS])
		[listener processModuleNotify:notifcationId withInParam:inParam];
	
	}
	
	notbroadcastlistenerVectorVec.pop_back();
	delete notbroadcastlistenerVector;
	notbroadcastlistenerVector = NULL;

}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
- (int)callModuleProcess:(int)funcId withInParam:(id)inParam andOutParam:(id*)outParam {
    
    NSString* key = [NSString stringWithFormat:@"%d", ModuleID(funcId)];
    id<ModuleProtocol> module =  [moduleDict_ valueForKey:key];
    
    if (module) {
        return [module callModuleProcess:CapabilityID(funcId) withInParam:inParam andOutParam:outParam];
    }
    
    return -1;
}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
- (int)callModuleDataProcess:(int)funcId withInParam:(id)inParam andOutParam:(id*)outParam {
	
	NSString* key = [NSString stringWithFormat:@"%d", ModuleID(funcId)];
    id<ModuleProtocol> module =  [moduleDict_ valueForKey:key];
    
    if (module) {
        return [module callModuleDataProcess:CapabilityID(funcId) withInParam:inParam andOutParam:outParam];
    }
    
    return -1;
}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
- (int)callModuleProcess:(int)funcId withInParam:(id)inParam {
    
    return [self callModuleProcess:funcId withInParam:inParam andOutParam:nil];
}

/**
 * @brief
 *
 * Detailed comments of this function
 * @param [in]
 * @param [out]
 * @return
 * @note
 */
- (void)dealloc {
    
    moduleDict_ = nil;
    
    moduleListenerArray_ = nil;
    
    listenerVector.clear();

}
@end
