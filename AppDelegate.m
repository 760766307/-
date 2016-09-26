//
//  AppDelegate.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/21.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "AppDelegate.h"
#import <AdSupport/AdSupport.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self zhuceTuisongWithApplication:application didFinishLaunchingWithOptions:launchOptions andUUIDString:[JJExtern sharedJJ].uuidString];
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


#if 1

//============================================================
//============================================================
//============================================================
//============================================================
//============================================================
//推送
//注册
- (void)zhuceTuisongWithApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions andUUIDString:(NSString *)uuidString{
#if 0
    

    //   http://www.jianshu.com/p/5639a3d2a2be
    UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    [application registerUserNotificationSettings:setting];
//    [[UIApplication sharedApplication] registerForRemoteNotifications];
//    UIUserNotificationType notypes =UIUserNotificationTypeBadge
//    |UIUserNotificationTypeSound
//    |UIUserNotificationTypeAlert;
//    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:notypes categories:nil];
//    [application registerUserNotificationSettings:settings];
    
//    AppKey
//    c524a6241d1409f3f539225dMaster
//    Secret
//    97514a9151871cf3977a8065
//    重置
//    Master Secret
//    创建时间
//    2016-09-23 17:22:23
//    修改时间
//    2016-09-23 17:22:24
#endif

    
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    //Required
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
//        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
//        entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
//        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    }
    else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    else {
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                          UIRemoteNotificationTypeSound |
                                                          UIRemoteNotificationTypeAlert)
                                              categories:nil];
    }
    
    //Required
    // init Push(2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil  )
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:channel
                 apsForProduction:isProduction
            advertisingIdentifier:advertisingId];  



}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken{
    [JPUSHService registerDeviceToken:deviceToken];

#if 0
    
    NSString *tokenString = [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<" withString:@""]
stringByReplacingOccurrencesOfString:@">" withString:@""]
stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"tokenstr is %@",tokenString);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:tokenString forKey:@"deviceToken"];
    [defaults synchronize];
    
#endif
  
    
}

#if 0




- (void)application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification{
//    （1）、收到远程推送时，点击APP图标启动，launchOptions中不会包含远程推送消息的键值对；
//    （2）、收到远程推送时，如果APP未启动，同时用户点击通知打开APP，则调用此方法，launchOptions中包含远程推送消息的键值对。
    
    
    
    
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
//    （1）、收到远程推送时，点击APP图标启动，不会调用此方法；
//    （2）、收到远程推送时，如果APP处于前台，调用此方法；
//    （3）、收到远程推送时，如果APP处于Background 或 Suspended 状态，此时远程推送包含 {"content-available":"1"}字段，则调用此方法，如果用户通过 App Switcher 将应用从后台 Kill 掉应用将不会唤醒应用处理 background 代码；如果远程推送不包含 {"content-available":"1"}字段，不会调用此方法。
}


// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

#endif



// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
//    NSDictionary * userInfo = response.notification.request.content.userInfo;
//    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//        [JPUSHService handleRemoteNotification:userInfo];
//    }
//    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}



//============================================================
//============================================================
//============================================================
//============================================================
//============================================================
#else

#endif

@end









