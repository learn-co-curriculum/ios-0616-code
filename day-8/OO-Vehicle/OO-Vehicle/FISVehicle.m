//
//  FISVehicle.m
//  
//
//  Created by Joe Burgess on 6/15/16.
//
//

#import "FISVehicle.h"

@implementation FISVehicle

- (instancetype) init {
    return [self initWithWeight:0.0 topSpeed:0.0 CurrentSpeed:0.0 CurrentDirection:0.0];
}
- (instancetype)initWithWeight:(CGFloat)weight topSpeed:(CGFloat)topSpeed
{
    return [self initWithWeight:weight topSpeed:topSpeed CurrentSpeed:0.0 CurrentDirection:0.0];
}

- (instancetype) initWithWeight:(CGFloat)weight topSpeed:(CGFloat)topSpeed CurrentSpeed:(CGFloat)currentSpeed CurrentDirection:(CGFloat)currentDirection
{
    self = [super init];

    if (self) {
        _weight = weight;
        _topSpeed = topSpeed;
        _currentSpeed = currentSpeed;
        _currentDirection = currentDirection;
    }

    return self;
}

- (void)setCurrentSpeed:(CGFloat)currentSpeed {
    if (currentSpeed < 1000.0) {
        _currentSpeed = currentSpeed;
        self.currentSpeed=currentSpeed;
    }
}

- (void)turnLeft
{
//    if (self.currentDirection == 0) {
//        self.currentDirection = 270;
//    } else if (self.currentDirection == 270.0) {
//        self.currentDirection = 180;
//    } else if (self.currentDirection == 180.0) {
//        self.currentDirection = 90;
//    } else if (self.currentDirection == 90) {
//        self.currentDirection = 0;
//    }

    self.currentDirection -= 90.0;
    if (self.currentDirection < 0 ) {
        self.currentDirection +=360;
    }
}



@end
