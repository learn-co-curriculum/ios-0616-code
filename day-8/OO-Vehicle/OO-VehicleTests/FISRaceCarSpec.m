//
//  FISRaceCarSpec.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISRaceCar.h"
#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(FISRaceCar)

describe(@"FISRaceCar", ^{
    __block FISRaceCar *raceCar = [[FISRaceCar alloc] init];
    
    it(@"is a subclass of FISCar", ^{
        expect(raceCar).to.beKindOf([FISCar class]);
    });
    
    describe(@"default init method sets", ^{
        it(@"weight to 1270",^{
            expect(raceCar.weight).to.equal(1270.0f);
        });
        
        it(@"topSpeed to 615",^{
            expect(raceCar.topSpeed).to.equal(615.0f);
        });
        
        it(@"isAutomatic to NO", ^{
            expect(raceCar.isAutomatic).to.beFalsy;
        });
        
        it(@"cylinders to 8", ^{
            expect(raceCar.cylinders).to.equal(8);
        });
        
        it(@"current speed to 0",^{
            expect(raceCar.currentSpeed).to.equal(0.0f);
        });
        
        it(@"current direction to 0 (north)",^{
            expect(raceCar.currentDirection).to.equal(0.0f);
        });
        
        it(@"sponsors to KFC, Taco Bell, Pizza Hut",^{
            expect(raceCar.sponsors).to.equal(@[@"KFC", @"Taco Bell", @"Pizza Hut"]);
        });
    });
});

SpecEnd
