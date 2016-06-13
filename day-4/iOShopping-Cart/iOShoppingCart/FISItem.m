//  FISItem.m

#import "FISItem.h"

@implementation FISItem

- (instancetype)init {
    self = [self initWithName:@""
                 priceInCents:0];
    return self;
}

- (instancetype)initWithName:(NSString *)name
                priceInCents:(NSUInteger)priceInCents {
    self = [super init];
    if (self) {
        _name = name;
        _priceInCents = priceInCents;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@ Price: %lu",self.name, self.priceInCents];
}

@end
