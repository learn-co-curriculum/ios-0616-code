//  FISCardSpec.m

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import <EXPMatchers+equalInAnyOrder.h>
#import "FISCard.h"


SpecBegin(FISCard)

describe(@"FISCard", ^{
    
    __block FISCard *defaultCard;
    __block FISCard *queenOfHearts;
    __block FISCard *aceOfSpades;
    __block FISCard *twoOfClubs;
    __block FISCard *tenOfDiamonds;
    
    beforeEach(^{
        defaultCard = [[FISCard alloc] init];
        queenOfHearts = [[FISCard alloc] initWithSuit:@"♥" rank:@"Q"];
        aceOfSpades = [[FISCard alloc] initWithSuit:@"♠" rank:@"A"];
        twoOfClubs = [[FISCard alloc] initWithSuit:@"♣" rank:@"2"];
        tenOfDiamonds = [[FISCard alloc] initWithSuit:@"♦" rank:@"10"];
    });
    
    describe(@"validSuits", ^{
        it(@"should return an array containing the card suits as strings", ^{
            expect([FISCard validSuits]).to.equalInAnyOrder(@[@"♠",@"♥",@"♣",@"♦"]);
        });
    });
    
    describe(@"validRanks", ^{
        it(@"should return an array containing the card ranks as string in ascending order with Ace first", ^{
            NSArray *ranks = @[ @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
            
            expect([FISCard validRanks]).to.equal(ranks);
        });
    });
    
    describe(@"default initializer", ^{
        it(@"should set suit to '!' and rank to 'N'", ^{
            expect(defaultCard.suit).to.equal(@"!");
            expect(defaultCard.rank).to.equal(@"N");
        });
        
        it(@"should set cardLabel to '!N'", ^{
            expect(defaultCard.cardLabel).to.equal(@"!N");
        });
    });
    
    describe(@"designated initializer", ^{
        it(@"should set suit to '♥' and rank to 'Q' for queenOfHearts", ^{
            expect(queenOfHearts.suit).to.equal(@"♥");
            expect(queenOfHearts.rank).to.equal(@"Q");
        });
        it(@"should set cardLabel to '♥Q' for queenOfHearts", ^{
            expect(queenOfHearts.cardLabel).to.equal(@"♥Q");
        });
        it(@"should set cardValue to '10' for queenOfHearts", ^{
            expect(queenOfHearts.cardValue).to.equal(10);
        });
        
        it(@"should set suit to '♠' and rank to 'A' for aceOfSpades", ^{
            expect(aceOfSpades.suit).to.equal(@"♠");
            expect(aceOfSpades.rank).to.equal(@"A");
        });
        it(@"should set cardLabel to '♠A' for aceOfSpades", ^{
            expect(aceOfSpades.cardLabel).to.equal(@"♠A");
        });
        it(@"should set cardValue to '1' for aceOfSpades", ^{
            expect(aceOfSpades.cardValue).to.equal(1);
        });

        it(@"should set suit to '♣' and rank to '2' for twoOfClubs", ^{
            expect(twoOfClubs.suit).to.equal(@"♣");
            expect(twoOfClubs.rank).to.equal(@"2");
        });
        it(@"should set cardLabel to '♣2' for twoOfClubs", ^{
            expect(twoOfClubs.cardLabel).to.equal(@"♣2");
        });
        it(@"should set cardValue to '1' for twoOfClubs", ^{
            expect(twoOfClubs.cardValue).to.equal(2);
        });
        
        it(@"should set suit to '♦' and rank to '10' for tenOfDiamonds", ^{
            expect(tenOfDiamonds.suit).to.equal(@"♦");
            expect(tenOfDiamonds.rank).to.equal(@"10");
        });
        it(@"should set cardLabel to '♦10' for tenOfDiamonds", ^{
            expect(tenOfDiamonds.cardLabel).to.equal(@"♦10");
        });
        it(@"should set cardValue to '10' for tenOfDiamonds", ^{
            expect(tenOfDiamonds.cardValue).to.equal(10);
        });
    });
    
    describe(@"cardValueForRank", ^{
        it(@"should return 1 for Ace", ^{
            defaultCard = [[FISCard alloc] initWithSuit:@"!" rank:@"A"];
            
            expect(defaultCard.cardValue).to.equal(1);
        });
        
        it(@"should return 2 for 2", ^{
            defaultCard = [[FISCard alloc] initWithSuit:@"!" rank:@"2"];
            
            expect(defaultCard.cardValue).to.equal(2);
        });

        it(@"should return 9 for 9", ^{
            defaultCard = [[FISCard alloc] initWithSuit:@"!" rank:@"9"];
            
            expect(defaultCard.cardValue).to.equal(9);
        });

        it(@"should return 10 for 10", ^{
            defaultCard = [[FISCard alloc] initWithSuit:@"!" rank:@"10"];
            
            expect(defaultCard.cardValue).to.equal(10);
        });

        it(@"should return 10 for Jack", ^{
            defaultCard = [[FISCard alloc] initWithSuit:@"!" rank:@"J"];
            
            expect(defaultCard.cardValue).to.equal(10);
        });

        it(@"should return 10 for Queen", ^{
            defaultCard = [[FISCard alloc] initWithSuit:@"!" rank:@"Q"];
            
            expect(defaultCard.cardValue).to.equal(10);
        });

        it(@"should return 10 for King", ^{
            defaultCard = [[FISCard alloc] initWithSuit:@"!" rank:@"K"];
            
            expect(defaultCard.cardValue).to.equal(10);
        });
    });
    
    describe(@"description property", ^{
        it(@"should return '♥Q' for queenOfHearts", ^{
            expect(queenOfHearts.description).to.equal(@"♥Q");
        });
        it(@"should return '♠A' for aceOfSpades", ^{
            expect(aceOfSpades.description).to.equal(@"♠A");
        });
        it(@"should return '♣2' for twoOfClubs", ^{
            expect(twoOfClubs.description).to.equal(@"♣2");
        });
        it(@"should return '♦10' for tenOfDiamonds", ^{
            expect(tenOfDiamonds.description).to.equal(@"♦10");
        });
    });
});

SpecEnd
