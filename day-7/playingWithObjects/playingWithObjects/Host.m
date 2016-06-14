//
//  Host.m
//  playingWithObjects
//
//  Created by Joe Burgess on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "Host.h"

@implementation Host

- (instancetype) initWithFirstName:(NSString *)firstName LastName:(NSString *)lastName PropertyAddress:(NSString *)propertyAddress {

    self = [super initWithFirstName:firstName LastName:lastName Height:@5];

    if (self) {
        _propertyAddress = propertyAddress;
    }

    return self;

}
- (NSString *)displayName {
    //"Your host for the evening will be: LASTNAME, FIRSTNAME"
    return [NSString stringWithFormat:@"Your host for the evening will be: %@",[super displayName]];
}



@end
