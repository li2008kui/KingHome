//
//  AppDelegate.m
//  KingHome
//
//  Created by kingsun on 14/12/15.
//  Copyright (c) 2014年 东莞勤上光电股份有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "DeviceViewController.h"
#import "MessageViewController.h"
#import "MoreViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    
    DeviceViewController *devVC = [[DeviceViewController alloc] init];
    devVC.tabBarItem.title = @"设备";
    devVC.tabBarItem.image = [UIImage imageNamed:@"devus"];
    devVC.tabBarItem.selectedImage = [UIImage imageNamed:@"devs"];
    UINavigationController *devNC = [[UINavigationController alloc] initWithRootViewController:devVC];
    
    MessageViewController *msgVC = [[MessageViewController alloc] init];
    msgVC.tabBarItem.title = @"消息";
    msgVC.tabBarItem.image = [UIImage imageNamed:@"msgus"];
    msgVC.tabBarItem.selectedImage = [UIImage imageNamed:@"msgs"];
    UINavigationController *msgNC = [[UINavigationController alloc] initWithRootViewController:msgVC];
    
    MoreViewController *morVC = [[MoreViewController alloc] init];
    morVC.tabBarItem.title = @"更多";
    morVC.tabBarItem.image = [UIImage imageNamed:@"morus"];
    morVC.tabBarItem.selectedImage = [UIImage imageNamed:@"mors"];
    UINavigationController *morNC = [[UINavigationController alloc] initWithRootViewController:morVC];
    
    UITabBarController *rootTabBC = [[UITabBarController alloc] init];
    rootTabBC.viewControllers = [NSArray arrayWithObjects:devNC, msgNC, morNC, nil];
    
    self.window.rootViewController = rootTabBC;
    
    [devNC release];
    [msgNC release];
    [morNC release];
    
    [devVC release];
    [msgVC release];
    [morVC release];
    [rootTabBC release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([url.scheme  isEqual: @"KingHomeEnter"]) {
        if ([url.host  isEqual: @"enter"]) {
            NSLog(@"从Today过来！");
        }
        
        return true;
    }
    
    return false;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
