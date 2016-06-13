//
//  FISShoppingCart.h
//  iOShoppingCart
//
//  Created by Joe Burgess on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISShoppingCart : NSObject

@property (strong, nonatomic) NSMutableArray *items;
//@property (strong, nonatomic) NSDictionary *myDictionary;
@property (strong, nonatomic) NSString *shippingAddress;

- (instancetype) init;
- (instancetype) initWithShippingAddress:(NSString *)address;
- (void)addItem:(FISItem *)item;

- (void) sortItemsByNameAsc;
- (void) sortItemsByPriceInCentsAsc;
- (NSUInteger) calculateTotalPriceInCents;


@end
