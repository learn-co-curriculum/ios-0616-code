//
//  FISCarSpec.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISCar.h"
#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(FISCar)

describe(@"FISCar", ^{
    __block FISCar *car;
    
    beforeEach(^{
        car = [[FISCar alloc] init];
    });
    
    it(@"is a subclass of FISVehicle", ^{
        expect(car).to.beKindOf([FISVehicle class]);
    });
    
    describe(@"default init method sets", ^{
        it(@"weight to 1270", ^{
            expect(car.weight).to.equal(1270.0f);
        });
        
        it(@"top speed to 88", ^{
            expect(car.topSpeed).to.equal(88.0f);
        });
        
        it(@"current speed to 0",^{
            expect(car.currentSpeed).to.equal(0.0f);
        });
        
        it(@"current direction to 0 (north)",^{
            expect(car.currentDirection).to.equal(0.0f);
        });
        
        it(@"isAutomatic to YES", ^{
            expect(car.isAutomatic).to.beTruthy;
        });
        
        it(@"cylinders to 4", ^{
            expect(car.cylinders).to.equal(4.0f);
        });
    });
});

SpecEnd
