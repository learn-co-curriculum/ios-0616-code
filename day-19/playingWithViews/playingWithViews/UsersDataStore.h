//
//  UsersDataStore.h
//  playingWithViews
//
//  Created by Joe Burgess on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UsersDataStore : NSObject
@property (strong, nonatomic) NSMutableArray *validUsers;

+ (id)sharedManager;

- (void)hiClaire;
@end
