//  FISCardSwitcherViewController.m

#import "FISCardSwitcherViewController.h"

@interface FISCardSwitcherViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomRightLabel;

@end

@implementation FISCardSwitcherViewController
// MARK: view loading
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.middleLabel.font = [UIFont boldSystemFontOfSize:40];
    self.middleLabel.textAlignment = NSTextAlignmentCenter;



    // Do any additional setup after loading the view.
    self.threeOfSpades = [[FISCard alloc] initWithSuit:@"♠️"
                                                  rank:@"3"];
    self.fourOfClubs = [[FISCard alloc] initWithSuit:@"♣️"
                                                rank:@"4"];
    self.eightOfDiamonds = [[FISCard alloc] initWithSuit:@"♦️"
                                                    rank:@"8"];
    self.tenOfHearts = [[FISCard alloc] initWithSuit:@"♥️"
                                                rank:@"10"];
}

// MARK: actions
- (IBAction)threeOfSpadesTapped:(id)sender {
    [self setLabelsForCard:self.threeOfSpades];
}
- (IBAction)fourOfClubsTapped:(id)sender {
    [self setLabelsForCard:self.fourOfClubs];
}
- (IBAction)eightOfDiamondsTapped:(id)sender {
    [self setLabelsForCard:self.eightOfDiamonds];
}
- (IBAction)tenOfHeartsTapped:(UIButton *)sender {
    [self setLabelsForCard:self.tenOfHearts];
}

- (void) setLabelsForCard:(FISCard *)card {
    self.topLeftLabel.text = card.cardLabel;
    self.middleLabel.text = card.cardLabel;
    self.bottomRightLabel.text = card.cardLabel;
}


@end
