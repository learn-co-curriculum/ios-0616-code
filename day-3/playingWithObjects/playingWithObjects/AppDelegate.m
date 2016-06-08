//
//  AppDelegate.m
//  playingWithObjects
//
//  Created by Joe Burgess on 6/8/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "AppDelegate.h"
#import "Feed.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    NSMutableArray *teachers = [[NSMutableArray alloc] init];
    [teachers addObject:@"Joe"];

    NSMutableArray *array = [[NSMutableArray alloc] init];

  //  NSLog(@"%@",array[0]);

    NSString *joesNAme = @"Joe";
    NSString *susansName = [[NSString alloc] init];

    NSLog(@"%@",susansName);

    Feed *billybob = [[Feed alloc] init];

    billybob.posts = @[@"Today was my first day at school", @"Today was my second day at school. It was great", @"Today was my third day, Joe is amazing"];

    Feed *joesFeed = [[Feed alloc] init];
    joesFeed.posts = @[@"I'm Hungry", @"I'm Thirsty"];

    NSString *joesLongestPost = [joesFeed longestPost];
    NSLog(@"Joes Longest Post is: %@",joesLongestPost);

    

   // [feed displayBlogPosts:@[@"Today was my first day at school", @"Today was my second day at school. It was great", @"Today was my third day, Joe is amazing"]];

    NSString *longestPost = [billybob longestPost];

    NSLog(@"%@",longestPost);



    
   // NSLog(@"%@",[feed greetUser]);
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
