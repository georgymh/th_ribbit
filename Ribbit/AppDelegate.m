//
//  AppDelegate.m
//  Ribbit
//
//  Created by Georgy Marrero on 1/7/15.
//  Copyright (c) 2015 Georgy Marrero. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [NSThread sleepForTimeInterval:1.5];
    
    // Initialize Parse.
    [Parse setApplicationId:@"ID" clientKey:@"KEY"];
    
    [self customizeUserInterface];

    return YES;
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

#pragma mark - Helper methods
     
- (void)customizeUserInterface {
    // Customize the nav bar
    ////////////////////////
    // purple bgcolor
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navBarBackground"] forBarMetrics:UIBarMetricsDefault];
    // white text on title
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    // white text on buttons
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    // Customize the tab bar
    ////////////////////////
    // NOTE: the bgcolor and selected bgcolor are set
    // in the storyboard, in the tab bar attributes
    // inspector, as well as the tint color
    
    // set text color to white
    //[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    // putting UITabBarItem's into variables
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    
    UITabBarItem *tabInbox = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabFriends = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabCamera = [tabBar.items objectAtIndex:2];
    
    // setting UIImage's with the icons
    UIImage *inboxIconImage = [[UIImage imageNamed:@"inbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *cameraIconImage = [[UIImage imageNamed:@"camera"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *friendsIconImage = [[UIImage imageNamed:@"friends"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // assigning UIImage's (icons) to the UITabBarItem's image property
    tabInbox = [tabInbox initWithTitle:nil image:inboxIconImage selectedImage:inboxIconImage];
    tabCamera = [tabCamera initWithTitle:nil image:cameraIconImage selectedImage:cameraIconImage];
    tabFriends = [tabFriends initWithTitle:nil image:friendsIconImage selectedImage:friendsIconImage];
    
    // centering the icons (vertically) within the UITabBarItem views
    tabInbox.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    tabFriends.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    tabCamera.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
}
     
@end
