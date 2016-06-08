//
//  FISTicTacToeGame.h
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISTicTacToeGame : NSObject

@property (nonatomic, assign) NSUInteger xPlayerWinCount;
@property (nonatomic, assign) NSUInteger oPlayerWinCount;

-(void)resetBoard;

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row;

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row;

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row;
-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row;

-(BOOL)isADraw;
-(NSString *)winningPlayer;

@end
