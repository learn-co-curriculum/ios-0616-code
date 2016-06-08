//
//  FISHumanPlayer.h
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToePlayer.h"

@interface FISHumanPlayer : NSObject <FISTicTacToePlayer>

@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, weak) FISTicTacToeGame *game;

-(void)playAtColumn:(NSUInteger)column row:(NSUInteger)row;

@end
