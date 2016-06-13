//  FISShoppingCartSpec.m

#import "Specta.h"
#import "FISShoppingCart.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISItem.h"

SpecBegin(FISShoppingCart)

describe(@"FISShoppingCart", ^{
    
    __block FISShoppingCart *shoppingCart;
    
    __block FISItem *item1;
    __block FISItem *item2;
    __block FISItem *item3;
    __block FISItem *item4;
    __block FISItem *item5;
    __block FISItem *item6;
    __block FISItem *item7;
    __block FISItem *item8;
    
    __block NSArray *items1through7;
    __block NSArray *allItems;
    
    beforeEach(^{
        shoppingCart = [[FISShoppingCart alloc] init];
        shoppingCart.items = [[NSMutableArray alloc] init];
        
        item1 = [[FISItem alloc] initWithName:@"hot pockets" priceInCents:499];
        item2 = [[FISItem alloc] initWithName:@"diet coke, 2l" priceInCents:249];
        item3 = [[FISItem alloc] initWithName:@"lean pockets" priceInCents:549];
        item4 = [[FISItem alloc] initWithName:@"digiorno pizza" priceInCents:899];
        item5 = [[FISItem alloc] initWithName:@"eggs, one dozen" priceInCents:189];
        item6 = [[FISItem alloc] initWithName:@"milk, half gallon" priceInCents:289];
        item7 = [[FISItem alloc] initWithName:@"whey protein powder" priceInCents:1499];
        item8 = [[FISItem alloc] initWithName:@"hot pockets" priceInCents:499];
        
        items1through7 = @[item1, item2, item3, item4, item5, item6, item7];
        allItems = @[item1, item2, item3, item4, item5, item6, item7, item8];
    });
    
    describe(@"calculateTotalPriceInCents", ^{
        it(@"should return 0 if the items array is empty", ^{
            expect([shoppingCart calculateTotalPriceInCents]).to.equal(0);
        });
        
        it(@"should return 499 when the array contains item1", ^{
            [shoppingCart.items addObject:item1];
            expect([shoppingCart calculateTotalPriceInCents]).to.equal(499);
        });
        
        it(@"should return 1998 when the array contains item1 and item7", ^{
            [shoppingCart.items addObject:item1];
            [shoppingCart.items addObject:item7];
            expect([shoppingCart calculateTotalPriceInCents]).to.equal(1998);
        });
    });
    
    describe(@"addItem:", ^{
        it(@"should add item1 to the items array", ^{
            [shoppingCart addItem:item1];
            expect(shoppingCart.items).to.equal(@[item1]);
        });
        
        it(@"should add item2, item3, and item4 to the items array", ^{
            [shoppingCart addItem:item2];
            [shoppingCart addItem:item3];
            [shoppingCart addItem:item4];
            expect(shoppingCart.items).to.equal(@[item2, item3, item4]);
        });
        
        it(@"should add a duplicate of item that is already in the items array", ^{
            [shoppingCart addItem:item1];
            [shoppingCart addItem:item1];
            expect(shoppingCart.items).to.equal(@[item1, item1]);
        });
    });
    
    describe(@"removeItem:", ^{
        it(@"should remove the submitted item from the items array", ^{
            [shoppingCart.items addObjectsFromArray:@[item1, item2, item3]];
            [shoppingCart removeItem:item2];
            expect(shoppingCart.items).to.equal(@[item1, item3]);
        });
        
        it(@"should remove only one item occurrence of the submitted item from the items array", ^{
            [shoppingCart.items addObjectsFromArray:@[item1, item8, item1]];
            [shoppingCart removeItem:item1];
            expect(shoppingCart.items).to.equal(@[item8, item1]);
        });
    });
    
    describe(@"removeAllItemsLikeItem:", ^{
        it(@"should remove all occurrences of the submitted item from the items array", ^{
            [shoppingCart.items addObjectsFromArray:@[item1, item8, item1]];
            [shoppingCart removeAllItemsLikeItem:item1];
            expect(shoppingCart.items).to.equal(@[item8]);
        });
    });
    
    describe(@"sortItemsByNameAsc", ^{
        it(@"should sort the items array by name in ascending order", ^{
            NSArray *items1through7SortedByNameAsc = @[item2, item4, item5, item1, item3, item6, item7];
            [shoppingCart.items addObjectsFromArray:items1through7];
            [shoppingCart sortItemsByNameAsc];
            expect(shoppingCart.items).to.equal(items1through7SortedByNameAsc);
        });
    });
    
    describe(@"sortItemsByNameDesc", ^{
        it(@"should sort the items array by name in descending order", ^{
            NSArray *items1through7SortedByNameDesc = @[item7, item6, item3, item1, item5, item4, item2];
            [shoppingCart.items addObjectsFromArray:items1through7];
            [shoppingCart sortItemsByNameDesc];
            expect(shoppingCart.items).to.equal(items1through7SortedByNameDesc);
        });
    });
    
    describe(@"sortItemsByPriceInCentsAsc", ^{
        it(@"should sort the items array by priceInCents in ascending order", ^{
            NSArray *items1through7SortedByPriceInCentsAsc = @[item5, item2, item6, item1, item3, item4, item7];
            [shoppingCart.items addObjectsFromArray:items1through7];
            [shoppingCart sortItemsByPriceInCentsAsc];
            expect(shoppingCart.items).to.equal(items1through7SortedByPriceInCentsAsc);
        });
    });
    
    describe(@"sortItemsByPriceInCentsDesc", ^{
        it(@"should sort the items array by priceInCents in descending order", ^{
            NSArray *items1through7sortedByPriceInCentsDesc = @[item7, item4, item3, item1, item6, item2, item5];
            [shoppingCart.items addObjectsFromArray:items1through7];
            [shoppingCart sortItemsByPriceInCentsDesc];
            expect(shoppingCart.items).to.equal(items1through7sortedByPriceInCentsDesc);
        });
    });
    
    describe(@"allItemsWithName:", ^{
        it(@"should return an array containing the item whose name matches the argument string", ^{
            [shoppingCart.items addObjectsFromArray:allItems];
            expect([shoppingCart allItemsWithName:@"diet coke, 2l"]).to.equal(@[item2]);
        });
        
        it(@"should return an array containing multiple items whose name matches the argument string", ^{
            [shoppingCart.items addObjectsFromArray:allItems];
            expect([shoppingCart allItemsWithName:@"hot pockets"]).to.equal(@[item1, item8]);
        });
        
        it(@"should return an empty array when there are no items whose name matches the argument string", ^{
            [shoppingCart.items addObjectsFromArray:allItems];
            expect([shoppingCart allItemsWithName:@"kale"]).to.equal(@[]);
        });
    });
    
    describe(@"allItemsWithMinimumPriceInCents:", ^{
        it(@"should return an array with all the items whose priceInCents is higher than 500", ^{
            NSArray *itemsWithPriceInCentsOver500 = @[item3, item4, item7];
            [shoppingCart.items addObjectsFromArray:allItems];
            NSArray *filteredArray = [shoppingCart allItemsWithMinimumPriceInCents:500];
            expect(filteredArray).to.equal(itemsWithPriceInCentsOver500);
        });
        
        it(@"should return an array including the items whose priceInCents matches 499", ^{
            NSArray *itemsWithMinimumPriceInCents499 = @[item1, item3, item4, item7, item8];
            [shoppingCart.items addObjectsFromArray:allItems];
            NSArray *filteredArray = [shoppingCart allItemsWithMinimumPriceInCents:499];
            expect(filteredArray).to.equal(itemsWithMinimumPriceInCents499);
        });
    });
    
    describe(@"allItemsWithMaximumPriceInCents:", ^{
        it(@"should return an array with all the items whose priceInCents is lower than 290", ^{
            NSArray *itemsWithPriceInCentsBelow290 = @[item2, item5, item6];
            [shoppingCart.items addObjectsFromArray:allItems];
            NSArray *filteredArray = [shoppingCart allItemsWithMaximumPriceInCents:290];
            expect(filteredArray).to.equal(itemsWithPriceInCentsBelow290);
        });
        
        it(@"should return an array including the items whose priceInCents matches 289", ^{
            NSArray *itemsWithMaximumPriceInCents289 = @[item2, item5, item6];
            [shoppingCart.items addObjectsFromArray:allItems];
            NSArray *filteredArray = [shoppingCart allItemsWithMaximumPriceInCents:289];
            expect(filteredArray).to.equal(itemsWithMaximumPriceInCents289);
        });
    });
});

SpecEnd
