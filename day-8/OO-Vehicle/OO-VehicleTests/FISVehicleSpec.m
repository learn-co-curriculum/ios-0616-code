//
//  FISVehicleSpec.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/4/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISVehicle.h"
#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(FISVehicle)

describe(@"FISVehicle", ^{
    __block FISVehicle *vehicle;
    
    beforeEach(^{
        vehicle = [[FISVehicle alloc] initWithWeight:0.0f topSpeed:0.0f];
    });
    
    it(@"is a subclass of NSObject", ^{
        expect(vehicle).to.beKindOf([NSObject class]);
    });
    
    it(@"can increase speed", ^{
        [vehicle increaseSpeed];
        expect([vehicle currentSpeed]).to.equal([vehicle topSpeed]);
    });
    
    it(@"can brake", ^{
        [vehicle increaseSpeed];
        [vehicle brake];
        expect([vehicle currentSpeed]).to.equal(0.0f);
    });
    
    describe(@"initWithWeight:topSpeed", ^{
        __block FISVehicle *aTestVehicle;
        __block CGFloat testWeight;
        __block CGFloat testSpeed;
        
        beforeAll(^{
            testWeight = 1000;
            testSpeed = 7777;
            aTestVehicle = [[FISVehicle alloc] initWithWeight: testWeight topSpeed:testSpeed];
        });
        
        it(@"sets weight appropriately", ^{
            expect(aTestVehicle.weight).to.equal(testWeight);
        });

        it(@"sets topSpeed appropriately", ^{
            expect(aTestVehicle.topSpeed).to.equal(testSpeed);
        });
        
        it(@"defaults currentSpeed to 0", ^{
            expect(aTestVehicle.currentSpeed).to.equal(0);
        });

        it(@"defaults currentDirection to 0", ^{
            expect(aTestVehicle.currentDirection).to.equal(0);
        });
    });
    
    describe(@"turnLeft", ^{
        it(@"turns -90 degrees", ^{
            [vehicle turnLeft];
            expect([vehicle currentDirection]).to.equal(270.0f);
        });
        
        it(@"works -360 degrees", ^{
            for(NSInteger x = 0; x < 4; x++)
           {
               [vehicle turnLeft];
           }
            expect([vehicle currentDirection]).to.equal(0.0f);
        });
        
    });
    
    describe(@"turnRight", ^{
        it(@"turns +90 degrees", ^{
            [vehicle turnRight];
            expect([vehicle currentDirection]).to.equal(90.0f);
        });
        
        it(@"works +360 degrees", ^{
            for(NSInteger x = 0; x < 4; x++)
            {
                [vehicle turnRight];
            }
            expect([vehicle currentDirection]).to.equal(0.0f);
        });
    });
    
});

SpecEnd
