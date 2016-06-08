//
//  FISGameOverViewController.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISGameOverViewController.h"
#import "FISBoardSpaceView.h"


@interface FISGameOverViewController ()

@property (weak, nonatomic) IBOutlet UIView *winnerContainer;
@property (weak, nonatomic) IBOutlet FISBoardSpaceView *winnerView;
@property (weak, nonatomic) IBOutlet UILabel *tieLabel;

@end


@implementation FISGameOverViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    if(self.winningPlayerSymbol.length) {
        self.winnerContainer.hidden = NO;
        self.tieLabel.hidden = YES;

        self.winnerView.symbol = self.winningPlayerSymbol;
    }
    else {
        self.tieLabel.hidden = NO;
        self.winnerContainer.hidden = YES;
    }
}

-(IBAction)playAgainButtonTapped:(id)sender
{
    [self.delegate gameOverViewControllerWillDismiss:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
