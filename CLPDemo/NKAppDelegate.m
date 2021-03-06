//
//  NKAppDelegate.m
//  CLPDemo
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKAppDelegate.h"
#import "NKHomeViewController.h"
#import "CLPDemoCore.h"

@interface NKAppDelegate ()

@end

@implementation NKAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [UIWindow new];
    [self.window setBackgroundColor:[UIColor clearColor]];
    NKHomeViewController *homeVC = [[NKHomeViewController alloc] init];
    NKNavigationController *rootNav = [[NKNavigationController alloc] initWithRootViewController:homeVC];
    [self.window setRootViewController:rootNav];
    [self.window makeKeyAndVisible];
    [NKServiceManager sharedManager];
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray * _Nullable))restorationHandler{
    NSString *activityType = userActivity.activityType;
    if([activityType isEqualToString:kActivityTypeAudioCall]){
        NSString *contactId = userActivity.userInfo[kKeyActivityUserInfoContactIdentifier];
        if(contactId){
            [NKUtil searchContactWithCategory:NKContactCategoryIdentifier value:contactId completionBlock:^(CNContact *aContact) {
                CNPhoneNumber *phoneNo = ((CNLabeledValue*)aContact.phoneNumbers.firstObject).value;
                NSString *url = [NSString stringWithFormat:@"tel:%@",phoneNo.stringValue];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:^(BOOL success) {
                }];
            }];
        }
    }
    else if([activityType isEqualToString:kActivityTypeSendPayment]){
        
    }
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
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
