//
//  User.m
//  playingWithObjects
//
//  Created by Joe Burgess on 6/9/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "User.h"

@interface User ()

    @property (strong, nonatomic) NSNumber *height;

@end

@implementation User

- (instancetype) init {
    return [self initWithFirstName:@"" LastName:@"" Height:@5];
}

- (instancetype)initWithFirstName:(NSString *)firstName LastName:(NSString *)lastName Height:(NSNumber *)height
{
    self = [super init];

    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _height = height;
    }

    return self;
}

- (NSString *)displayName {
    // @"Joe Burgess"

    return [NSString stringWithFormat:@"%@, %@",self.lastName,self.firstName];
}

- (void) walkForward {
    NSLog(@"Left arm, left leg, right arm, right leg");
}

+ (void) feedAll {
    NSLog(@"Raining Gerber");
}

- (void)grow {
    NSInteger heightInt = [self.height integerValue];
    self.height =@(heightInt + 4);
}
- (void) walkForwardTenTimes {
    for (NSUInteger i =0; i<10; i++) {
        [self walkForward];
    }
}
@end
