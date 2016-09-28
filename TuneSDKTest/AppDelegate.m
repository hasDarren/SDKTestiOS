//
//  AppDelegate.m
//  TuneSDKTest
//
//  Created by Darren Chu on 9/27/16.
//  Copyright © 2016 Darren Chu. All rights reserved.
//

#import "AppDelegate.h"
@import AdSupport;
@import CoreTelephony;
@import Tune;
@import MobileCoreServices;
@import iAd;
@import Security;
@import StoreKit;
@import SystemConfiguration;
@import Tune;
 
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Tune initializeWithTuneAdvertiserId:@"190163"
                       tuneConversionKey:@"198dacaee0fd940d83ad259a27ec6fd5"];
    
#ifdef DEBUG
    [Tune setPackageName:@"com.TuneSDKTest"];
#else
    [Tune setPackageName:@"com.TuneSDKTest"];
#endif
    
    NSLog(@"Hello World");
    

    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications];

    
    
    return YES;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [Tune application:application tuneDidRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [Tune application:application tuneDidFailToRegisterForRemoteNotificationsWithError:error];
}

// iOS 9+
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler
{
    [Tune application:application tuneHandleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
}

// iOS 8+
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{
    [Tune application:application tuneHandleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
}

// iOS 7+
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    [Tune application:application tuneDidReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
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

    [Tune measureSession];
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
  options:(NSDictionary<NSString *, id> *)options{
    NSString *sourceApplication = options[UIApplicationOpenURLOptionsSourceApplicationKey];
    
    [Tune applicationDidOpenURL:url.absoluteString sourceApplication:sourceApplication];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
