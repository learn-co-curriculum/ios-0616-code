//
//  FISNewGameViewController.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISNewGameViewController.h"
#import "FISComputerPlayer.h"
#import "FISTicTacToeViewController.h"
#import <FontAwesomeKit/FAKIonIcons.h>


@interface FISNewGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *heartLabel;

@property (weak, nonatomic) IBOutlet UILabel *xLabel;
@property (weak, nonatomic) IBOutlet UIButton *xPlayerButton;
@property (weak, nonatomic) IBOutlet UILabel *oLabel;
@property (weak, nonatomic) IBOutlet UIButton *oPlayerButton;

@property (weak, nonatomic) IBOutlet UILabel *aiWarningLabel;

@end


@implementation FISNewGameViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    self.aiWarningLabel.alpha = 0;

    FAKIcon *xIcon = [FAKIonIcons androidCloseIconWithSize:50];
    [xIcon addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.937 green:0.345 blue:0.357 alpha:1.000]];
    self.xLabel.attributedText = xIcon.attributedString;

    FAKIcon *oIcon = [FAKIonIcons androidRadioButtonOffIconWithSize:45];
    [oIcon addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.078 green:0.698 blue:0.851 alpha:1.000]];
    self.oLabel.attributedText = oIcon.attributedString;

    self.heartLabel.attributedText = [FAKIonIcons heartIconWithSize:350].attributedString;
}

-(void)flashWarningLabel
{
    [UIView animateKeyframesWithDuration:5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.05 animations:^{
            self.aiWarningLabel.alpha = 1;
        }];

        [UIView addKeyframeWithRelativeStartTime:0.9 relativeDuration:0.1 animations:^{
            self.aiWarningLabel.alpha = 0;
        }];
    } completion:nil];
}

-(IBAction)xPlayerButtonTapped:(UIButton *)sender
{
    if(![FISComputerPlayer isEnabled]) {
        [self flashWarningLabel];
        return;
    }

    sender.selected = !sender.selected;
}

-(IBAction)oPlayerButtonTapped:(UIButton *)sender
{
    if(![FISComputerPlayer isEnabled]) {
        [self flashWarningLabel];
        return;
    }

    sender.selected = !sender.selected;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    BOOL xPlayerIsAI = self.xPlayerButton.selected;
    BOOL oPlayerIsAI = self.oPlayerButton.selected;

    FISTicTacToeViewController *tttVC = segue.destinationViewController;
    tttVC.xPlayerIsAI = xPlayerIsAI;
    tttVC.oPlayerIsAI = oPlayerIsAI;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
