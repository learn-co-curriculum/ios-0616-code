//
//  Renter.h
//  playingWithObjects
//
//  Created by Joe Burgess on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Renter : User

@property (strong,nonatomic) NSString *creditCardNumber;
@property (nonatomic) NSInteger rating;

- (NSString *)displayName;

@end
