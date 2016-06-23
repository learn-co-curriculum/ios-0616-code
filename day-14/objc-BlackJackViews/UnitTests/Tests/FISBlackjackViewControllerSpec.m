//  FISBlackjackViewControllerSpec.m

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "FISBlackjackViewController.h"
#import "FISCard.h"


SpecBegin(FISBlackjackViewController)

describe(@"FISBlackjackViewController", ^{
    
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
    
    __block FISBlackjackViewController *blackjackVC;
    
    beforeEach(^{
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        blackjackVC = [main instantiateViewControllerWithIdentifier:@"blackjackVC"];
        
        [UIApplication sharedApplication].keyWindow.rootViewController = blackjackVC;
    });
    
    describe(@"initial view", ^{
        it(@"should hide all of the house's card views", ^{
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"houseCard1"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"houseCard2"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"houseCard3"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"houseCard4"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"houseCard5"];
        });
        
        it(@"should hide all of the player's card views", ^{
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"playerCard1"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"playerCard2"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"playerCard3"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"playerCard4"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"playerCard5"];
        });
        
        it(@"should hide the winner, houseScore, busted, and blackjack labels", ^{
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"winner"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"houseScore"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"houseBusted"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"houseBlackjack"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"playerBusted"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"playerBlackjack"];
        });
    });
    
    describe(@"deal button", ^{
        it(@"should unhide at least the first two card views for the house and the player", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            [tester waitForViewWithAccessibilityLabel:@"houseCard1"];
            [tester waitForViewWithAccessibilityLabel:@"houseCard2"];
            [tester waitForViewWithAccessibilityLabel:@"playerCard1"];
            [tester waitForViewWithAccessibilityLabel:@"playerCard2"];
        });
        
        it(@"should show the card labels in the card views", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            // the house's first card should ideally be kept hidden
            FISCard *cardHouse2 = blackjackVC.game.house.cardsInHand[1];
            FISCard *cardPlayer1 = blackjackVC.game.player.cardsInHand[0];
            FISCard *cardPlayer2 = blackjackVC.game.player.cardsInHand[1];
            
            UILabel *houseCard2 = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"houseCard2"];
            UILabel *playerCard1 = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"playerCard1"];
            UILabel *playerCard2 = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"playerCard2"];
            
            
            expect(houseCard2.text).to.equal(cardHouse2.cardLabel);
            expect(playerCard1.text).to.equal(cardPlayer1.cardLabel);
            expect(playerCard2.text).to.equal(cardPlayer2.cardLabel);
        });

        
        it(@"should update the player's score label to show the current score", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UILabel *playerScore = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"playerScore"];
            
            NSString *playerScoreString = [NSString stringWithFormat:@"%lu", blackjackVC.game.player.handscore];
            
            expect(playerScore.text).to.endWith(playerScoreString);
        });
        
        it(@"should enable the hit button, or reenable the deal button if the player may not hit", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UIButton *hit = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"hit"];
            
            if (hit.enabled) {
                [tester tapViewWithAccessibilityLabel:@"hit"];
            } else {
                [tester tapViewWithAccessibilityLabel:@"deal"];
            }
        });
        
        it(@"should enable the stay button, or reenable the deal button if the player may not hit", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UIButton *stay = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"stay"];
            
            if (stay.enabled) {
                [tester tapViewWithAccessibilityLabel:@"stay"];
            } else {
                [tester tapViewWithAccessibilityLabel:@"deal"];
            }
        });
    });
    
    
    describe(@"hit", ^{
        it(@"should show a third card in the player's card views", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            [tester tapViewWithAccessibilityLabel:@"hit"];
            
            [tester waitForViewWithAccessibilityLabel:@"playerCard3"];
        });
        
        it(@"should update the player's score label with the new score", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UIButton *hit = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"hit"];
            
            if (hit.enabled) {
                [tester tapViewWithAccessibilityLabel:@"hit"];
            }
            
            UILabel *playerScore = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"playerScore"];
            
            NSString *playerScoreString = [NSString stringWithFormat:@"%lu", blackjackVC.game.player.handscore];
            
            expect(playerScore.text).to.endWith(playerScoreString);
        });
    });
    
    
    describe(@"stay", ^{
        it(@"should disable the hit button if the deal did not produce a winner", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UIButton *stay = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"stay"];
            
            if (stay.enabled) {
                [tester tapViewWithAccessibilityLabel:@"stay"];
            }
            
            UIButton *hit = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"hit"];
            
            expect(hit.enabled).to.beFalsy();
        });
        
        it(@"should disable itself if the deal did not produce a winner", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UIButton *stay = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"stay"];
            
            if (stay.enabled) {
                [tester tapViewWithAccessibilityLabel:@"stay"];
            }
            
            expect(stay.enabled).to.beFalsy();
        });
        
        it(@"should reenable the deal button if the deal did not produce a winner, if it did, deal should be reenabled", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UIButton *stay = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"stay"];
            
            if (stay.enabled) {
                [tester tapViewWithAccessibilityLabel:@"stay"];
            }
            [tester tapViewWithAccessibilityLabel:@"deal"];
        });
        
        it(@"should show the player's stayed label", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UIButton *stay = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"stay"];
            
            if (stay.enabled) {
                [tester tapViewWithAccessibilityLabel:@"stay"];
                [tester waitForViewWithAccessibilityLabel:@"playerStayed"];
            }
        });
        
        it(@"should display the winner", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UIButton *stay = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"stay"];
            
            if (stay.enabled) {
                [tester tapViewWithAccessibilityLabel:@"stay"];
            }
            
            [tester waitForViewWithAccessibilityLabel:@"winner"];
        });
        
        it(@"should display the house's score", ^{
            [tester tapViewWithAccessibilityLabel:@"deal"];
            
            UIButton *stay = (UIButton *)[tester waitForViewWithAccessibilityLabel:@"stay"];
            
            if (stay.enabled) {
                [tester tapViewWithAccessibilityLabel:@"stay"];
            }

            UILabel *houseScore = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"houseScore"];
            
            NSString *houseScoreString = [NSString stringWithFormat:@"%lu", blackjackVC.game.house.handscore];
            
            expect(houseScore.text).to.endWith(houseScoreString);
        });
    });
});

SpecEnd
