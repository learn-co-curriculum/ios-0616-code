//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Joe Burgess on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (instancetype) init {

//    self = [super init];
//
//    if (self) {
//        _items = [[NSMutableArray alloc] init];
//        _shippingAddress = @"";
//    }
//    return self;

    return  [self initWithShippingAddress:@""];
}

- (instancetype) initWithShippingAddress:(NSString *)address {
    self = [super init];

    if (self) {
        _items = [[NSMutableArray alloc] init];
        _shippingAddress = address;

    }

    return self;
}

- (void)addItem:(FISItem *)item
{
    NSLog(@"Before: %@",self.items);
    [self.items addObject:item];
     NSLog(@"After: %@",self.items);
}

- (void)sortItemsByNameAsc {
    NSSortDescriptor *nameSorter = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];

    [self.items sortUsingDescriptors:@[nameSorter]];


}

- (void)sortItemsByPriceInCentsAsc {
    NSSortDescriptor *priceSorter = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:YES];

    [self.items sortUsingDescriptors:@[priceSorter]];
}

- (NSUInteger)calculateTotalPriceInCents {
    NSUInteger total = 0;

    for (NSUInteger i=0; i<[self.items count]; i++) {
        FISItem *currentItem = self.items[i];
        total = total + currentItem.priceInCents;
    }

    return total;

}

@end
