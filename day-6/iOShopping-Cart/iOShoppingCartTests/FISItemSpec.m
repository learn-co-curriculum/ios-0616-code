//  FISItemSpec.m

#import "Specta.h"
#import "FISItem.h"
#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(FISItem)

describe(@"FISItem", ^{
    
    __block FISItem *defaultItem;
    __block FISItem *hotPockets;
    __block FISItem *leanPockets;
    
    beforeEach(^{
        defaultItem = [[FISItem alloc] init];
        hotPockets = [[FISItem alloc] initWithName:@"Hot Pockets" priceInCents:499];
        leanPockets = [[FISItem alloc] initWithName:@"Lean Pockets" priceInCents:549];
    });

    describe(@"default initializer", ^{
        it(@"should set name to empty string and priceInCents to 0", ^{
            expect(defaultItem.name).to.equal(@"");
            expect(defaultItem.priceInCents).to.equal(0);
        });
    });
    
    describe(@"designated initializer", ^{
        it(@"should set name and priceInCents to submitted argument values", ^{
            expect(hotPockets.name).to.equal(@"Hot Pockets");
            expect(hotPockets.priceInCents).to.equal(499);
            expect(leanPockets.name).to.equal(@"Lean Pockets");
            expect(leanPockets.priceInCents).to.equal(549);
        });
    });
    
});

SpecEnd
