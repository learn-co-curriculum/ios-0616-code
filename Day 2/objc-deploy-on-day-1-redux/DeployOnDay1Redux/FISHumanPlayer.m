//
//  FISHumanPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISHumanPlayer.h"


@interface FISHumanPlayer ()

@property (nonatomic, strong) void (^playCompletionBlock)(NSUInteger column, NSUInteger row);

@end


@implementation FISHumanPlayer

-(void)decidePlayWithCompletion:(void (^)(NSUInteger, NSUInteger))completion
{
    self.playCompletionBlock = completion;
}

-(void)setPlayCompletionBlock:(void (^)(NSUInteger, NSUInteger))playCompletionBlock
{
    _playCompletionBlock = playCompletionBlock;
}

-(void)playAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if(self.playCompletionBlock)
    {
        self.playCompletionBlock(column, row);
        self.playCompletionBlock = nil;
    }
}

-(void)cancelPlay
{
    self.playCompletionBlock = nil;
}

@end
