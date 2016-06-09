//
//  User.h
//  playingWithObjects
//
//  Created by Joe Burgess on 6/9/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong,nonatomic) NSString *firstName;
@property (strong, nonatomic, readonly) NSNumber *height;



- (void) walkForwardTenTimes;
+ (void) feedAll;
- (void) grow;


@end
