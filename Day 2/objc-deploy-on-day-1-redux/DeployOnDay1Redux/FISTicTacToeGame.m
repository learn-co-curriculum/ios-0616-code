//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        [self resetBoard];
        // check it out but leave the rest of this method alone :)

    }

    return self;
}

-(void)resetBoard
{
    self.board = [[NSMutableArray alloc] init];

    NSArray *topRow = @[@"",@"",@""];
    NSArray *middleRow = @[@"",@"",@""];
    NSArray *bottomRow = @[@"",@"",@""];

    [self.board addObject:topRow];
    [self.board addObject:middleRow];
    [self.board addObject:bottomRow];

    [self isBoardValidWithBoard:self.board];

    NSString *blah = nil;
    [blah stringByAppendingString:@"Blah"];


}

- (BOOL) isBoardValidWithBoard:(NSMutableArray *)board {

}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    //self.board = @[@[@"",@"",@""],
    //               @[@"",@"",@""],
    //               @[@"",@"",@""]]

//    NSArray *theRow = self.board[row];
//    return theRow[column];

    return self.board[row][column];
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    return YES;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{

}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{

}

-(NSString *)winningPlayer
{
    return @"";
}

-(BOOL)isADraw
{
    return NO;
}

@end
