//
//  FISComputerPlayer.h
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"


typedef struct {
    NSUInteger column;
    NSUInteger row;
} FISTicTacToePosition;

FISTicTacToePosition FISTicTacToePositionMake(NSUInteger column, NSUInteger row);


@interface FISComputerPlayer : NSObject

+(BOOL)isEnabled;

@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, weak) FISTicTacToeGame *game;

-(FISTicTacToePosition)nextPlay;

@end
