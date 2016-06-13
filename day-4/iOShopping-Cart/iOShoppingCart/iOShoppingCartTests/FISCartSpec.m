//
//  FISCartSpec.m
//  iOShoppingCart
//
//  Created by Chris Gonzales on 5/8/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISCart.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISItem.h"

SpecBegin(FISCart)

describe(@"FISCart", ^{
    __block FISCart *cart;
    __block FISItem *item1 = [[FISItem alloc] initWithName:@"hot pockets" andPrice:@1];
    __block FISItem *item2 = [[FISItem alloc] initWithName:@"diet coke" andPrice:@2];
    __block FISItem *item3 = [[FISItem alloc] initWithName:@"hot pockets" andPrice:@1];
    __block FISItem *item4 = [[FISItem alloc] initWithName:@"DiGiorno" andPrice:@5];
    __block FISItem *item5 = [[FISItem alloc] initWithName:@"eggs" andPrice:@3];
    __block FISItem *item6 = [[FISItem alloc] initWithName:@"milk" andPrice:@4];
    __block FISItem *item7 = [[FISItem alloc] initWithName:@"protein powder" andPrice:@10];
    
    
    beforeAll(^{
        cart = [[FISCart alloc] init];
    });
    
    beforeEach(^{
        [cart addItem:item1];
        [cart addItem:item2];
        [cart addItem:item3];
        [cart addItem:item4];
        [cart addItem:item5];
        [cart addItem:item6];
        [cart addItem:item7];
    });
    
    
    it(@"is an FISCart", ^{
        expect(cart).notTo.beNil();
        expect(cart).to.beInstanceOf([FISCart class]);
    });
    
    it(@"has items",^{
        expect(cart).to.respondTo(@selector(items));
        expect(cart).to.respondTo(@selector(setItems:));
        expect(cart.items).to.beKindOf([NSMutableArray class]);
    });
    
    it(@"can add an item to the cart",^{
        FISItem *itemToAdd = [[FISItem alloc] initWithName:@"cheez-its" andPrice:@4];
        [cart addItem:itemToAdd];
        expect([cart.items lastObject]).to.equal(itemToAdd);
    });
    
    describe(@"removeItem:", ^{
        it(@"can remove an item from the cart",^{
            FISItem *itemToRemove = [cart.items firstObject];
            [cart removeItem:itemToRemove];
            
            expect([cart.items containsObject:itemToRemove]).to.beFalsy();
        });
    });
    
    it(@"can return a total price for the cart",^{
        expect([cart total]).to.equal(@26);
    });
        
    it(@"can return the total number of items in the cart",^{
        expect([cart numOfItems]).to.equal(@7);
    });
    
    it(@"can return items sorted by name",^{
        expect([cart itemsSortedByName]).to.equal(@[item2, item4, item5, item1, item3, item6, item7]);
    });
    
    it(@"can return items sorted by price",^{
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES selector:@selector(compare:)];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray *sortedItems = [cart.items sortedArrayUsingDescriptors:sortDescriptors];
        
        expect([cart itemsSortedByPrice]).to.equal(sortedItems);
    });
    
    describe(@"itemsWithName:", ^{
        it(@"returns all items with a given name",^{
            NSArray *query1 = [cart itemsWithName:@"hot pockets"];
            
            expect([query1 count]).to.equal(2);
            
            for(FISItem *item in query1) {
                expect(item.name).to.equal(@"hot pockets");
            }
        });
        
        it(@"returns an empty array if there are no matching items in the cart",^{
            NSArray *query2 = [cart itemsWithName:@"nilla wafers"];
            expect(query2).to.equal(@[]);
        });
    });
    
    describe(@"itemsMoreExpensiveThan:", ^{
        it(@"returns all items more expensive than a given price",^{
            NSArray *query1 = [cart itemsMoreExpensiveThan:@3];
            
            expect([query1 count]).to.equal(3);
            
            for(FISItem *item in query1) {
                expect(item.price).to.beGreaterThan(@3);
            }
        });
        
        it(@"returns an empty array if there are no matching items in the cart",^{
            NSArray *query2 = [cart itemsMoreExpensiveThan:@15];
            expect(query2).to.equal(@[]);
        });
        
    });
    
    afterEach(^{
        [cart.items removeAllObjects]; 
    });
    
    
    
});

SpecEnd
