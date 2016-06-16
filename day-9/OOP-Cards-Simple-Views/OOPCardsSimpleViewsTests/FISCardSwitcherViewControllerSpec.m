//  FISCardSwitcherViewControllerSpec.m

#import "Specta.h"
#import "FISCardSwitcherViewController.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "Swizzlean.h"

SpecBegin(FISCardSwitcherViewController)

describe(@"FISCardSwitcherViewController", ^{
    
    beforeAll(^{
        
    });
    
    beforeEach(^{

    });
    
    it(@"should have the current card labels", ^{
        UILabel *topLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"topLabel"];
        expect(topLabel).toNot.beNil();
        UILabel *middleLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"middleLabel"];
        expect(middleLabel).toNot.beNil();
        UILabel *bottomLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"bottomLabel"];
        expect(bottomLabel).toNot.beNil();
    });
    
    it(@"should have four buttons, labeled appropriately",^{
        UIButton *button1 = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"threeOfSpadesButton"];
        expect(button1.titleLabel.text).to.equal(@"♠️3");
        
        UIButton *button2 = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"fourOfClubsButton"];
        expect(button2.titleLabel.text).to.equal(@"♣️4");
        
        UIButton *button3 = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"eightOfDiamondsButton"];
        expect(button3.titleLabel.text).to.equal(@"♦️8");
        
        UIButton *button4 = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"tenOfHeartsButton"];
        expect(button4.titleLabel.text).to.equal(@"♥️10");
    });
    
    describe(@"threeOfSpadesButtonTapped", ^{
        it(@"should change the current card info to three of spades info",^{
            [tester tapViewWithAccessibilityLabel:@"threeOfSpadesButton"];
        UILabel *topLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"topLabel"];
            expect(topLabel.text).to.equal(@"♠️3");
        UILabel *middleLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"middleLabel"];
        expect(middleLabel.text).to.equal(@"♠️3");
        UILabel *bottomLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"bottomLabel"];
        expect(bottomLabel.text).to.equal(@"♠️3");
        });
    });
    
    describe(@"fourOfClubsButtonTapped", ^{
        it(@"should change the current card info to four of clubs info",^{
            [tester tapViewWithAccessibilityLabel:@"fourOfClubsButton"];
        UILabel *topLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"topLabel"];
            expect(topLabel.text).to.equal(@"♣️4");
        UILabel *middleLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"middleLabel"];
        expect(middleLabel.text).to.equal(@"♣️4");
        UILabel *bottomLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"bottomLabel"];
        expect(bottomLabel.text).to.equal(@"♣️4");
        });
    });
    
    describe(@"eightOfDiamondsTapped", ^{
        it(@"should change the current card info to eight of diamonds info",^{
            [tester tapViewWithAccessibilityLabel:@"eightOfDiamondsButton"];
        UILabel *topLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"topLabel"];
            expect(topLabel.text).to.equal(@"♦️8");
        UILabel *middleLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"middleLabel"];
        expect(middleLabel.text).to.equal(@"♦️8");
        UILabel *bottomLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"bottomLabel"];
        expect(bottomLabel.text).to.equal(@"♦️8");
        });
    });
    
    describe(@"tenOfHeartsTapped", ^{
        it(@"should change the current card info to ten of hearts info",^{
            [tester tapViewWithAccessibilityLabel:@"tenOfHeartsButton"];
        UILabel *topLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"topLabel"];
            expect(topLabel.text).to.equal(@"♥️10");
        UILabel *middleLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"middleLabel"];
        expect(middleLabel.text).to.equal(@"♥️10");
        UILabel *bottomLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"bottomLabel"];
        expect(bottomLabel.text).to.equal(@"♥️10");
        });
    });
});

SpecEnd
