//
//  FISComputerPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISComputerPlayer.h"

@implementation FISComputerPlayer

+(BOOL)isEnabled
{
    return NO;
}

-(FISTicTacToePosition)nextPlay
{
    return FISTicTacToePositionMake(0, 0);
}

@end
