//  FISAppDelegateSpec.m

#import "Specta.h"
#import "FISAppDelegate.h"
#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{
    
    describe(@"solveTrivia method", ^{
        it(@"returns the only state whose capital contains none of the characters as the state name", ^{
            FISAppDelegate *appDelegate = ((FISAppDelegate*)[UIApplication sharedApplication].delegate);
            expect([appDelegate solveTrivia]).to.equal(@"South Dakota");
        });
    });
    
});

SpecEnd
