//
//  Renter.m
//  playingWithObjects
//
//  Created by Joe Burgess on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "Renter.h"

@implementation Renter

- (NSString *)displayName {
    return [NSString stringWithFormat:@"%@ %@",self.firstName, self.lastName];
}
@end
