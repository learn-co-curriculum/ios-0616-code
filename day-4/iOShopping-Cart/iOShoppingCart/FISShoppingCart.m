//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Joe Burgess on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

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


@end
