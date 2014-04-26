//
//  AppDelegate.m
//  Scooter
//
//  Created by xingyanl on 14-3-30.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import "AppDelegate.h"
#import "UIBaseNavigationViewController.h"
#import "ModuleManagementFramework.h"
#import "ModuleDef.h"


//#import "UIBaseNavigationViewController.h"
#import "MainViewController.h"

@interface AppDelegate (PrivateMethods)

- (void)_initModule;
- (void)_exitModule;

@end



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self _initModule];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //整个程序的入口rootViewController
    MainViewController *mainViewCtrl = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    
    //使用UINavigationController作为根控制器
    UIBaseNavigationViewController *navCtrl = [[UIBaseNavigationViewController alloc] initWithRootViewController:mainViewCtrl];
    self.window.rootViewController = navCtrl;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)_initModule
{
    ModuleManagementFramework *frameWork = [ModuleManagementFramework defaultModuleManagementFramework];
    
    //注册LanguageModule
    [frameWork registerModule:[[LanguageModule alloc] init]];
    
    //注册电车蓝牙模块
//    [frameWork registerModule:[[ScooterBluetoothModule alloc] init]];
    
}



@end
