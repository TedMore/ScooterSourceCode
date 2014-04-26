//
//  ModuleProtocol.h
//  Scooter
//
//  Created by xingyanl on 14-3-31.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModuleManagementFramework;

@interface ModuleInfo : NSObject {
    
@private
    
    int moduleId_;
    
    ModuleManagementFramework* __unsafe_unretained moduleManagementFramework_;
}

@property(nonatomic, assign) int moduleId;
@property(nonatomic, unsafe_unretained) ModuleManagementFramework* moduleManagementFramework;

- (id)init;


@end
