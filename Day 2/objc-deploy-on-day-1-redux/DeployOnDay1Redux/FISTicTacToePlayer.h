//
//  FISTicTacToePlayer.h
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISTicTacToeGame.h"


@protocol FISTicTacToePlayer <NSObject>

@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, weak) FISTicTacToeGame *game;

-(void)decidePlayWithCompletion:(void (^)(NSUInteger column, NSUInteger row))completion;
-(void)cancelPlay;

@end
