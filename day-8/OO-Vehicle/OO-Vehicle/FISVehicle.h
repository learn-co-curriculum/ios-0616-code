//
//  FISVehicle.h
//  
//
//  Created by Joe Burgess on 6/15/16.
//
//

#import <Foundation/Foundation.h>

@interface FISVehicle : NSObject

@property (nonatomic) CGFloat weight;
@property (nonatomic) CGFloat topSpeed;
@property (nonatomic) CGFloat currentSpeed;
@property (nonatomic) CGFloat currentDirection;

- (instancetype) init;
-(instancetype)initWithWeight:(CGFloat)weight topSpeed:(CGFloat)topSpeed;
- (instancetype) initWithWeight:(CGFloat)weight topSpeed:(CGFloat)topSpeed CurrentSpeed:(CGFloat)currentSpeed CurrentDirection:(CGFloat) currentDirection;
-(void)increaseSpeed;
-(void)brake;
-(void)turnLeft;
-(void)turnRight;


@end
