//
//  Host.h
//  playingWithObjects
//
//  Created by Joe Burgess on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Host : User


@property (strong, nonatomic) NSString *propertyAddress;
@property (nonatomic) NSInteger nightlyRate;

- (instancetype) initWithFirstName:(NSString *)firstName LastName:(NSString *)lastName PropertyAddress:(NSString *)propertyAddress;

@end
