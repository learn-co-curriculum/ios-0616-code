//  FISBlackjackPlayerSpec.m

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISBlackjackPlayer.h"
#import "FISCard.h"


SpecBegin(FISBlackjackPlayer)

describe(@"FISBlackjackPlayer", ^{
    
    __block FISCard *queenOfHearts;
    __block FISCard *aceOfSpades;
    __block FISCard *aceOfClubs;
    __block FISCard *twoOfClubs;
    __block FISCard *tenOfDiamonds;
    
    beforeAll(^{
        queenOfHearts = [[FISCard alloc] initWithSuit:@"♥" rank:@"Q"];
        aceOfSpades = [[FISCard alloc] initWithSuit:@"♠" rank:@"A"];
        aceOfClubs = [[FISCard alloc] initWithSuit:@"♣" rank:@"A"];
        twoOfClubs = [[FISCard alloc] initWithSuit:@"♣" rank:@"2"];
        tenOfDiamonds = [[FISCard alloc] initWithSuit:@"♦" rank:@"10"];
    });
    
    __block FISBlackjackPlayer *defaultPlayer;
    __block FISBlackjackPlayer *designatedPlayer;
    
    beforeEach(^{
        
        defaultPlayer = [[FISBlackjackPlayer alloc] init];
        designatedPlayer = [[FISBlackjackPlayer alloc] initWithName:@"Mark"];
        
    });
    
    describe(@"default initializer", ^{
        it(@"should set the name property to an empty string", ^{
            expect(defaultPlayer.name).to.equal(@"");
        });
        
        it(@"should initialize cardsInHand to an empty mutable array", ^{
            expect(defaultPlayer.cardsInHand).to.equal([[NSMutableArray alloc] init]);
        });
        
        it(@"should set integer properties to 0", ^{
            expect(defaultPlayer.handscore).to.equal(0);
            expect(defaultPlayer.wins).to.equal(0);
            expect(defaultPlayer.losses).to.equal(0);
        });
        
        it(@"should set boolean properties to NO", ^{
            expect(defaultPlayer.aceInHand).to.beFalsy();
            expect(defaultPlayer.blackjack).to.beFalsy();
            expect(defaultPlayer.busted).to.beFalsy();
            expect(defaultPlayer.stayed).to.beFalsy();
        });
    });
    
    describe(@"designated initializer", ^{
        it(@"should set the name property to the argument string", ^{
            expect(designatedPlayer.name).to.equal(@"Mark");
        });
        
        it(@"should initialize cardsInHand to an empty mutable array", ^{
            expect(designatedPlayer.cardsInHand).to.equal([[NSMutableArray alloc] init]);
        });
        
        it(@"should set integer properties to 0", ^{
            expect(designatedPlayer.handscore).to.equal(0);
            expect(designatedPlayer.wins).to.equal(0);
            expect(designatedPlayer.losses).to.equal(0);
        });
        
        it(@"should set boolean properties to NO", ^{
            expect(designatedPlayer.aceInHand).to.beFalsy();
            expect(designatedPlayer.blackjack).to.beFalsy();
            expect(designatedPlayer.busted).to.beFalsy();
            expect(designatedPlayer.stayed).to.beFalsy();
        });
    });
    
    __block FISBlackjackPlayer *acceptCardPlayer;
    
    beforeEach(^{
        
        acceptCardPlayer = [[FISBlackjackPlayer alloc] init];
        
    });
    
    describe(@"acceptCard", ^{
        it(@"should add ♥Q to the cardsInHand array", ^{
            [acceptCardPlayer acceptCard:queenOfHearts];
            
            expect(acceptCardPlayer.cardsInHand).to.contain(queenOfHearts);
            expect(acceptCardPlayer.cardsInHand.count).to.equal(1);
        });
        
        it(@"should set the handscore to 10 when ♥Q is added", ^{
            [acceptCardPlayer acceptCard:queenOfHearts];
            
            expect(acceptCardPlayer.handscore).to.equal(10);
        });
        
        it(@"should set the handscore to 10 when ♦10 is added", ^{
            [acceptCardPlayer acceptCard:tenOfDiamonds];
            
            expect(acceptCardPlayer.handscore).to.equal(10);
        });
        
        it(@"should set the handscore to 2 when ♣2 is added", ^{
            [acceptCardPlayer acceptCard:twoOfClubs];
            
            expect(acceptCardPlayer.handscore).to.equal(2);
        });
        
        it(@"should set the handscore to 12 when ♥Q and ♣2 are added", ^{
            [acceptCardPlayer acceptCard:queenOfHearts];
            [acceptCardPlayer acceptCard:twoOfClubs];
            
            expect(acceptCardPlayer.handscore).to.equal(12);
        });
        
        
        it(@"should detect an ace in the hand", ^{
            [acceptCardPlayer acceptCard:aceOfSpades];
            
            expect(acceptCardPlayer.aceInHand).to.beTruthy();
        });
        
        it(@"should use a lone ace as a score of 11 ", ^{
            [acceptCardPlayer acceptCard:aceOfSpades];
            
            expect(acceptCardPlayer.handscore).to.equal(11);
        });
        
        it(@"should set handscore to 12 when two aces are in the hand", ^{
            [acceptCardPlayer acceptCard:aceOfSpades];
            [acceptCardPlayer acceptCard:aceOfClubs];
            
            expect(acceptCardPlayer.handscore).to.equal(12);
            expect(acceptCardPlayer.aceInHand).to.beTruthy();
            expect(acceptCardPlayer.busted).to.beFalsy();
        });
        
        it(@"should detect a busted hand at a score of 22 or higher", ^{
            [acceptCardPlayer acceptCard:queenOfHearts];
            [acceptCardPlayer acceptCard:tenOfDiamonds];
            [acceptCardPlayer acceptCard:twoOfClubs];
            
            expect(acceptCardPlayer.handscore).to.equal(22);
            expect(acceptCardPlayer.busted).to.beTruthy();
        });
        
        it(@"should use an ace as 1 when the score is over 11", ^{
            [acceptCardPlayer acceptCard:tenOfDiamonds];
            [acceptCardPlayer acceptCard:twoOfClubs];
            [acceptCardPlayer acceptCard:aceOfSpades];
            
            expect(acceptCardPlayer.handscore).to.equal(13);
            expect(acceptCardPlayer.aceInHand).to.beTruthy();
            expect(acceptCardPlayer.busted).to.beFalsy();
        });
        
        it(@"should detect a blackjack hand (a score of 21 with two cards)", ^{
            [acceptCardPlayer acceptCard:queenOfHearts];
            [acceptCardPlayer acceptCard:aceOfSpades];
            
            expect(acceptCardPlayer.handscore).to.equal(21);
            expect(acceptCardPlayer.blackjack).to.beTruthy();
            expect(acceptCardPlayer.busted).to.beFalsy();
        });
        
        it(@"should not incorrectly bust a hand due to an ace", ^{
            [acceptCardPlayer acceptCard:tenOfDiamonds];
            [acceptCardPlayer acceptCard:queenOfHearts];
            [acceptCardPlayer acceptCard:aceOfSpades];
            
            expect(acceptCardPlayer.handscore).to.equal(21);
            expect(acceptCardPlayer.aceInHand).to.beTruthy();
            expect(acceptCardPlayer.busted).to.beFalsy();
        });
    });
    
    __block FISBlackjackPlayer *shouldHitPlayer;
    
    beforeEach(^{
        
        shouldHitPlayer = [[FISBlackjackPlayer alloc] init];
        
    });
    
    describe(@"shouldHit", ^{
        it(@"should hit if the handscore is 12", ^{
            [shouldHitPlayer acceptCard:queenOfHearts];
            [shouldHitPlayer acceptCard:twoOfClubs];
            
            expect([shouldHitPlayer shouldHit]).to.beTruthy();
        });
        
        it(@"should not hit if the handscore is 20", ^{
            [shouldHitPlayer acceptCard:queenOfHearts];
            [shouldHitPlayer acceptCard:tenOfDiamonds];
            
            expect([shouldHitPlayer shouldHit]).to.beFalsy();
        });
        
        it(@"should set stayed to YES if shouldHit returns NO", ^{
            [shouldHitPlayer acceptCard:queenOfHearts];
            [shouldHitPlayer acceptCard:tenOfDiamonds];
            
            expect([shouldHitPlayer shouldHit]).to.beFalsy();
            expect(shouldHitPlayer.stayed).to.beTruthy();
        });
    });
    
    __block FISBlackjackPlayer *newGamePlayer;
    
    beforeEach(^{
        
        newGamePlayer = [[FISBlackjackPlayer alloc] init];
        
    });
    
    describe(@"newGame", ^{
        it(@"should empty the cardsInHand array", ^{
            [newGamePlayer acceptCard:queenOfHearts];
            [newGamePlayer acceptCard:aceOfClubs];
            
            [newGamePlayer resetForNewGame];
            
            expect(newGamePlayer.cardsInHand.count).to.equal(0);
        });
        
        it(@"should reset the handscore to zero", ^{
            [newGamePlayer acceptCard:queenOfHearts];
            [newGamePlayer acceptCard:aceOfClubs];
            
            [newGamePlayer resetForNewGame];
            
            expect(newGamePlayer.handscore).to.equal(0);
        });
        
        it(@"should set aceInHand to NO", ^{
            newGamePlayer.aceInHand = YES;
            [newGamePlayer resetForNewGame];
            
            expect(newGamePlayer.aceInHand).to.beFalsy();
        });
        
        it(@"should set stayed to NO", ^{
            newGamePlayer.stayed = YES;
            [newGamePlayer resetForNewGame];
            
            expect(newGamePlayer.stayed).to.beFalsy();
        });
        
        it(@"should set blackjack to NO", ^{
            newGamePlayer.blackjack = YES;
            [newGamePlayer resetForNewGame];
            
            expect(newGamePlayer.blackjack).to.beFalsy();
        });
        
        it(@"should set busted to NO", ^{
            newGamePlayer.busted = YES;
            [newGamePlayer resetForNewGame];
            
            expect(newGamePlayer.busted).to.beFalsy();
        });
        
        it(@"should not reset wins", ^{
            newGamePlayer.wins = 42;
            
            expect(newGamePlayer.wins).to.equal(42);
        });
        
        it(@"should not reset losses", ^{
            newGamePlayer.losses = 24;
            
            expect(newGamePlayer.losses).to.equal(24);
        });
    });
    
    describe(@"description", ^{
        it(@"should label a readout for each of the properties", ^{
            expect(defaultPlayer.description.lowercaseString).to.contain(@"name");
            expect(defaultPlayer.description.lowercaseString).to.contain(@"cards");
            expect(defaultPlayer.description.lowercaseString).to.contain(@"handscore");
            expect(defaultPlayer.description.lowercaseString).to.contain(@"ace");
            expect(defaultPlayer.description.lowercaseString).to.contain(@"blackjack");
            expect(defaultPlayer.description.lowercaseString).to.contain(@"busted");
            expect(defaultPlayer.description.lowercaseString).to.contain(@"stayed");
            expect(defaultPlayer.description.lowercaseString).to.contain(@"wins");
            expect(defaultPlayer.description.lowercaseString).to.contain(@"losses");
        });
    });
});

SpecEnd
