//  FISBlackjackGameSpec.m

#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISBlackjackGame.h"


SpecBegin(FISBlackjackGame)

describe(@"FISBlackjackGame", ^{
    
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
    
    __block FISBlackjackGame *defaultGame;
    
    beforeEach(^{
        
        defaultGame = [[FISBlackjackGame alloc] init];
        
    });
    
    describe(@"default initializer", ^{
        it(@"should initialize the deck", ^{
            expect(defaultGame.deck).toNot.beNil();
            expect(defaultGame.deck.remainingCards.count).to.equal(52);
        });
        
        it(@"should initialize house with the name House", ^{
            expect(defaultGame.house).toNot.beNil();
            expect(defaultGame.house.name).to.equal(@"House");
        });
        
        it(@"should initialize player with the name Player", ^{
            expect(defaultGame.player).toNot.beNil();
            expect(defaultGame.player.name).to.equal(@"Player");
        });
    });
    
    describe(@"dealCardToPlayer", ^{
        it(@"should give the player's hand a card from the deck", ^{
            [defaultGame dealCardToPlayer];
            
            expect(defaultGame.player.cardsInHand.count).to.equal(1);
            expect(defaultGame.player.handscore).to.beGreaterThan(0);
            expect(defaultGame.deck.remainingCards.count).to.equal(51);
        });
    });

    describe(@"dealCardToHouse", ^{
        it(@"should give the house's hand a card from the deck", ^{
            [defaultGame dealCardToHouse];
            
            expect(defaultGame.house.cardsInHand.count).to.equal(1);
            expect(defaultGame.house.handscore).to.beGreaterThan(0);
            expect(defaultGame.deck.remainingCards.count).to.equal(51);
        });
    });
    
    describe(@"newDeal", ^{
        it(@"should deal two cards each to the player and to the house", ^{
            [defaultGame dealNewRound];
            
            expect(defaultGame.player.cardsInHand.count).to.equal(2);
            expect(defaultGame.player.handscore).to.beGreaterThan(0);
            expect(defaultGame.house.cardsInHand.count).to.equal(2);
            expect(defaultGame.house.handscore).to.beGreaterThan(0);
            expect(defaultGame.deck.remainingCards.count).to.equal(48);
        });
    });

    describe(@"playerTurn", ^{
        it(@"should deal a card to the player if the player decides to hit", ^{
            [defaultGame processPlayerTurn];
            
            expect(defaultGame.player.cardsInHand.count).to.equal(1);
        });
        
        it(@"should not deal a card to the player if the player decides not to hit", ^{
            [defaultGame.player acceptCard:tenOfDiamonds];
            [defaultGame.player acceptCard:queenOfHearts];
            [defaultGame processPlayerTurn];
            
            expect(defaultGame.player.cardsInHand.count).to.equal(2);
        });
        
        it(@"should not deal to the player if the player is busted", ^{
            defaultGame.player.busted = YES;
            [defaultGame processPlayerTurn];
            
            expect(defaultGame.player.cardsInHand.count).to.equal(0);
        });
        
        it(@"should not deal to the player if the player has stayed", ^{
            defaultGame.player.stayed = YES;
            [defaultGame processPlayerTurn];
            
            expect(defaultGame.player.cardsInHand.count).to.equal(0);
        });
    });

    describe(@"houseTurn", ^{
        it(@"should deal a card to the house if the house decides to hit", ^{
            [defaultGame processHouseTurn];
            
            expect(defaultGame.house.cardsInHand.count).to.equal(1);
        });
        
        it(@"should not deal a card to the house if the house decides not to hit", ^{
            [defaultGame.house acceptCard:tenOfDiamonds];
            [defaultGame.house acceptCard:queenOfHearts];
            [defaultGame processHouseTurn];
            
            expect(defaultGame.house.cardsInHand.count).to.equal(2);
        });
        
        it(@"should not deal to the house if the house is busted", ^{
            defaultGame.house.busted = YES;
            [defaultGame processHouseTurn];
            
            expect(defaultGame.house.cardsInHand.count).to.equal(0);
        });
        
        it(@"should not deal to the house if the hosue has stayed", ^{
            defaultGame.house.stayed = YES;
            [defaultGame processHouseTurn];
            
            expect(defaultGame.house.cardsInHand.count).to.equal(0);
        });
    });

    describe(@"houseWins", ^{
        it(@"should return NO if both the house and the player have blackjack hands", ^{
            // this is technically a 'push' (a tie) in blackjack rules, but our implementation isn't complex enough for this third outcome
            defaultGame.house.blackjack = YES;
            defaultGame.player.blackjack = YES;
            
            expect([defaultGame houseWins]).to.beFalsy();
        });
        
        it(@"should return NO if the house is busted", ^{
            defaultGame.house.busted = YES;
            
            expect([defaultGame houseWins]).to.beFalsy();
        });
        
        it(@"should return YES if the player is busted", ^{
            defaultGame.player.busted = YES;
            
            expect([defaultGame houseWins]).to.beTruthy();
        });
        
        it(@"should return NO if the player's handscore is greater than the house's handscore", ^{
            [defaultGame.player acceptCard:tenOfDiamonds];
            [defaultGame.house acceptCard:twoOfClubs];
            
            expect([defaultGame houseWins]).to.beFalsy();
        });
        
        it(@"should return YES if the house's handscore is greater than the player's handscore", ^{
            [defaultGame.house acceptCard:tenOfDiamonds];
            [defaultGame.player acceptCard:twoOfClubs];
            
            expect([defaultGame houseWins]).to.beTruthy();
        });
        
        it(@"should return YES if the house's handscore is equal to the player's handscore", ^{
            [defaultGame.house acceptCard:tenOfDiamonds];
            [defaultGame.player acceptCard:queenOfHearts];
            
            expect([defaultGame houseWins]).to.beTruthy();
        });
    });

    describe(@"incrementWinsAndLossesForHouseWins", ^{
        it(@"should increment house.wins and player.losses by one if the argument is YES", ^{
            [defaultGame incrementWinsAndLossesForHouseWins:YES];
            
            expect(defaultGame.house.wins).to.equal(1);
            expect(defaultGame.player.losses).to.equal(1);
        });
        
        it(@"should increment house.losses and player.wins by one if the argument is NO", ^{
            [defaultGame incrementWinsAndLossesForHouseWins:NO];
            
            expect(defaultGame.house.losses).to.equal(1);
            expect(defaultGame.player.wins).to.equal(1);
        });
        
        it(@"should not increment house.losses or player.wins by one if the argument is YES", ^{
            [defaultGame incrementWinsAndLossesForHouseWins:YES];
            
            expect(defaultGame.house.losses).to.equal(0);
            expect(defaultGame.player.wins).to.equal(0);
        });
        
        it(@"should not increment house.wins or player.losses by one if the argument is NO", ^{
            [defaultGame incrementWinsAndLossesForHouseWins:NO];
            
            expect(defaultGame.house.wins).to.equal(0);
            expect(defaultGame.player.losses).to.equal(0);
        });
    });
});

SpecEnd
