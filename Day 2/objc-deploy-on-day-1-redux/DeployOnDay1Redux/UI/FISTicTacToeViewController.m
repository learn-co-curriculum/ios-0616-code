//
//  FISTicTacToeViewController.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeViewController.h"
#import "FISBoardSpaceView.h"
#import "FISTicTacToeGame.h"
#import "FISHumanPlayer.h"
#import "FISComputerPlayer+Guts.h"
#import "FISGameOverViewController.h"
#import <FontAwesomeKit/FAKIonIcons.h>


@interface FISTicTacToeViewController () <FISGameOverViewControllerDelegate>

@property (nonatomic, strong) IBOutletCollection(FISBoardSpaceView) NSArray *boardSpaces;

@property (weak, nonatomic) IBOutlet FISBoardSpaceView *currentPlayerView;

@property (weak, nonatomic) IBOutlet UILabel *xPlayerIconLabel;
@property (weak, nonatomic) IBOutlet UILabel *xPlayerAIIconLabel;
@property (weak, nonatomic) IBOutlet UILabel *xPlayerWinsLabel;

@property (weak, nonatomic) IBOutlet UILabel *oPlayerIconLabel;
@property (weak, nonatomic) IBOutlet UILabel *oPlayerAIIconLabel;
@property (weak, nonatomic) IBOutlet UILabel *oPlayerWinsLabel;

@property (nonatomic, strong) FISTicTacToeGame *game;
@property (nonatomic, strong) id<FISTicTacToePlayer> xPlayer;
@property (nonatomic, strong) id<FISTicTacToePlayer> oPlayer;

@property (nonatomic, strong) id<FISTicTacToePlayer> currentPlayer;

@property (nonatomic, strong) NSString *winningPlayerSymbol;

@property (nonatomic, assign) BOOL gameIsCanceled;

@end


@implementation FISTicTacToeViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    for(FISBoardSpaceView *boardSpace in self.boardSpaces) {
        [boardSpace addTarget:self action:@selector(boardSpaceTapped:) forControlEvents:UIControlEventTouchUpInside];
    }

    self.game = [[FISTicTacToeGame alloc] init];
    [self startGame];
}

-(void)startGame
{
    if(self.xPlayerIsAI) {
        self.xPlayer = [[FISComputerPlayer alloc] init];
    }
    else {
        self.xPlayer = [[FISHumanPlayer alloc] init];
    }

    self.xPlayer.symbol = @"X";
    self.xPlayer.game = self.game;

    if(self.oPlayerIsAI) {
        self.oPlayer = [[FISComputerPlayer alloc] init];
    }
    else {
        self.oPlayer = [[FISHumanPlayer alloc] init];
    }
    self.oPlayer.symbol = @"O";
    self.oPlayer.game = self.game;


    [self.game resetBoard];
    [self reloadBoard];
    [self setUpPlayerDisplays];

    self.currentPlayer = self.xPlayer;
    [self handleTurn];
}

-(void)setCurrentPlayer:(id<FISTicTacToePlayer>)currentPlayer
{
    _currentPlayer = currentPlayer;
    self.currentPlayerView.symbol = currentPlayer.symbol;
}

-(NSAttributedString *)centeredAttributedStringForIcon:(FAKIcon *)icon
{
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [icon addAttribute:NSParagraphStyleAttributeName value:paragraphStyle];

    return icon.attributedString;
}

-(NSAttributedString *)attributedStringForAIIconForPlayer:(id<FISTicTacToePlayer>)player
{
    FAKIcon *icon;

    if([player isKindOfClass:[FISHumanPlayer class]]) {
        icon = [FAKIonIcons iosPersonIconWithSize:22];
    }
    else {
        icon = [FAKIonIcons outletIconWithSize:22];
    }

    return [self centeredAttributedStringForIcon:icon];
}

-(void)setUpPlayerDisplays
{
    self.xPlayerIconLabel.attributedText = [self centeredAttributedStringForIcon:[FAKIonIcons androidCloseIconWithSize:20]];
    self.xPlayerAIIconLabel.attributedText = [self attributedStringForAIIconForPlayer:self.xPlayer];
    self.xPlayerWinsLabel.text = [NSString stringWithFormat:@"%lu win%@", self.game.xPlayerWinCount, self.game.xPlayerWinCount == 1 ? @"" : @"s"];

    self.oPlayerIconLabel.attributedText = [self centeredAttributedStringForIcon:[FAKIonIcons androidRadioButtonOffIconWithSize:16]];
    self.oPlayerAIIconLabel.attributedText = [self attributedStringForAIIconForPlayer:self.oPlayer];
    self.oPlayerWinsLabel.text = [NSString stringWithFormat:@"%lu win%@", self.game.oPlayerWinCount, self.game.oPlayerWinCount == 1 ? @"" : @"s"];
}

-(void)handleTurn
{
    NSOperationQueue *bgQueue = [[NSOperationQueue alloc] init];

    [bgQueue addOperationWithBlock:^{
        [self.currentPlayer decidePlayWithCompletion:^(NSUInteger column, NSUInteger row) {
            if(self.gameIsCanceled) {
                return;
            }

            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if(self.currentPlayer == self.xPlayer) {
                    [self.game playXAtColumn:column row:row];
                }
                else {
                    [self.game playOAtColumn:column row:row];
                }

                [self reloadBoard];
                
                [self nextTurnOrEndGame];
            }];
        }];
    }];
}

-(void)reloadBoard
{
    for(FISBoardSpaceView *boardSpace in self.boardSpaces) {
        boardSpace.symbol = [self.game playerAtColumn:boardSpace.column row:boardSpace.row];
    }
}

-(void)nextTurnOrEndGame
{
    NSString *winningPlayerSymbol = [self.game winningPlayer];
    if(winningPlayerSymbol.length) {
        [self endGameWithWinningPlayerSymbol:winningPlayerSymbol];
        return;
    }

    if([self.game isADraw]) {
        [self endGameWithWinningPlayerSymbol:nil];
        return;
    }

    if(self.currentPlayer == self.xPlayer) {
        self.currentPlayer = self.oPlayer;
    }
    else {
        self.currentPlayer = self.xPlayer;
    }

    [self handleTurn];
}

-(void)endGameWithWinningPlayerSymbol:(NSString *)symbol
{
    if([symbol isEqualToString:@"X"]) {
        self.game.xPlayerWinCount++;
    }
    else if([symbol isEqualToString:@"O"]) {
        self.game.oPlayerWinCount++;
    }

    self.winningPlayerSymbol = symbol;
    [self performSegueWithIdentifier:@"GameToWinModalSegueID" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FISGameOverViewController *gameOverVC = segue.destinationViewController;
    gameOverVC.winningPlayerSymbol = self.winningPlayerSymbol;
    gameOverVC.delegate = self;
}

-(void)gameOverViewControllerWillDismiss:(FISGameOverViewController *)gameOverViewController
{
    [self startGame];
}

-(void)boardSpaceTapped:(FISBoardSpaceView *)sender
{
    if(![self.game canPlayAtColumn:sender.column row:sender.row]) {
        return;
    }

    if([self.currentPlayer isKindOfClass:[FISHumanPlayer class]]) {
        [((FISHumanPlayer *)self.currentPlayer) playAtColumn:sender.column row:sender.row];
    }
}

-(IBAction)backButtonTapped:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are you sure you want to exit?" message:@"The current game will be lost forever!" preferredStyle:UIAlertControllerStyleActionSheet];

    [alert addAction:[UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        self.gameIsCanceled = YES;
        [self.currentPlayer cancelPlay];
        [self.navigationController popViewControllerAnimated:YES];
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];

    [self presentViewController:alert animated:YES completion:nil];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
