//
//  AppDelegate.m
//  playing-with-code
//
//  Created by Joe Burgess on 6/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    NSInteger leftSide = 5;
//    NSInteger rightSide = 5;
//    NSInteger sum = leftSide + rightSide;
//
//    NSDate *today = [NSDate date];
//
//    NSNumber *sumAsNum = @(sum+1);
//    ;
//
//    NSInteger sumPlusOne = [sumAsNum integerValue] + 1;
//
//    NSString *five = @"5";
//
//    NSInteger fivePlusOne = [five integerValue] +1;
//    NSLog(@"%li",fivePlusOne);
//
//
////    NSInteger sumPlusOne = sum +1;
////    sum = sum +1;
//
//    NSLog(@"%@ %@",today,sumAsNum);
//    NSLog(@"Hello, World! %li",sum);
//

    [self greetUserName:@"Medina" AndShirtColor:@"Dark Blue"];
    return YES;
}

- (void)greetUserName:(NSString *)name AndShirtColor:(NSString *)colorOfShirt
{
    NSLog(@"Welcome %@. You are wearing a %@ shirt",name,colorOfShirt);
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
