//
//  FISComputerPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISComputerPlayer+Guts.h"

FISTicTacToePosition FISTicTacToePositionMake(NSUInteger column, NSUInteger row)
{
    return (FISTicTacToePosition){ .column = column, .row = row };
}


@implementation FISComputerPlayer (Guts)

-(void)decidePlayWithCompletion:(void (^)(NSUInteger column, NSUInteger row))completion
{
    FISTicTacToePosition play = [self nextPlay];

    if(![self.game canPlayAtColumn:play.column row:play.row]) {
        NSLog(@"Computer player tried to play at an invalid location (%lu, %lu), which is currently occupied with '%@'. Ignoring!", play.column, play.row, [self.game playerAtColumn:play.column row:play.row]);

        return;
    }

    // Arbitrary "thinking" delay
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completion(play.column, play.row);
    });
}

-(void)cancelPlay
{
    
}

@end
