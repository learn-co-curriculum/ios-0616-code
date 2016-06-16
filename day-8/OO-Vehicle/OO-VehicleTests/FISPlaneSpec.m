//
//  FISPlaneSpec.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISPlane.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISVehicle.h"

SpecBegin(FISPlane)

describe(@"FISPlane", ^{
    __block FISPlane *plane;
    
    beforeEach(^{
        plane = [[FISPlane alloc] init];
    });
    
    it(@"is a subclass of FISVehicle", ^{
        expect(plane).to.beKindOf([FISVehicle class]);
    });
    
    describe(@"default init method sets", ^{
        it(@"weight to 255000", ^{
            expect(plane.weight).to.equal(255000.0f);
        });
        
        it(@"topSpeed to 614", ^{
            expect(plane.topSpeed).to.equal(614.0f);
        });
        
        it(@"currentSpeed to 0",^{
            expect(plane.currentSpeed).to.equal(0.0f);
        });
        
        it(@"currentDirection to 0 (north)",^{
            expect(plane.currentDirection).to.equal(0.0f);
        });
        
        it(@"currentAltitude to 0",^{
            expect(plane.currentAltitude).to.equal(0.0f);
        });
        
        it(@"topAltitude to 30000",^{
            expect(plane.topAltitude).to.equal(30000);
        });
    });
    
    describe(@"increaseAltitude", ^{
        it(@"changes currentAltitude to topAltitude",^{
            [plane increaseAltitude];
            expect([plane currentAltitude]).to.equal(plane.topAltitude);
        });
    });
    
    describe(@"decreaseAltitude", ^{
        it(@"decreases currentAltitude to 0",^{
            [plane increaseAltitude];
            [plane decreaseAltitude];
            expect([plane currentAltitude]).to.equal(0.0f);
        });
    });
    
    
});

SpecEnd
