//
//  UsersDataStore.m
//  playingWithViews
//
//  Created by Joe Burgess on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "UsersDataStore.h"

@implementation UsersDataStore


+ (id)sharedManager {
    static UsersDataStore *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype) init {
    self = [super init];
    if (self){
        _validUsers = [[NSMutableArray alloc] init];
    }

    return self;
}

- (void)hiClaire {
    NSLog(@"Hi Claire");
}
@end
