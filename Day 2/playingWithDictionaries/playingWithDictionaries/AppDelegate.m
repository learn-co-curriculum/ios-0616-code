//
//  AppDelegate.m
//  playingWithDictionaries
//
//  Created by Joe Burgess on 6/7/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.



    NSArray *myArray = @[@"hello",@"my",@"name"];

    NSLog(@"%@",myArray[1]);

    NSDictionary *myDictionary = @{@"firstName": @"Joe",
                                   @"lastName": @"Burgess"};


    NSLog(@"%@",myDictionary[@"firstName"]);
//
//    NSInteger i=0;
//    for (; ; ) {
//        // NSInteger i=0;  BAD
//        NSLog(@"Helllllllo This is the %li time I've called this",i);
//
//        i = i+1;
//        if (i>=10) {
//            break;
//        }
//    }

//    NSArray *dictionaryKeys = [myDictionary allKeys];
////                      2<2
//    for (NSUInteger i=0; i<[dictionaryKeys count]; i++) {
//        NSString *key = dictionaryKeys[i];
//        NSLog(@"The items are %@", myDictionary[key]);
//
//    }

//    NSLog(@"%@",myDictionary);
//    NSArray *dictionaryValues = [myDictionary allValues];
//    for (NSInteger i=0; i<[dictionaryValues count]; i++) {
//        NSLog(@"%@",dictionaryValues[i]);
//    }

    for (NSString *myKey in myDictionary) {
        NSLog(@"%@",myDictionary[myKey]);
    }

    for (NSLog(@"initialize"); 1<4; NSLog(@"Increment")) {
        NSLog(@"In Loop");
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
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
