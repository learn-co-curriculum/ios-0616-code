//  FISBlackjackViewController.m

#import "FISBlackjackViewController.h"

@interface FISBlackjackViewController ()

@property (weak, nonatomic) IBOutlet UILabel *winner;


@property (weak, nonatomic) IBOutlet UILabel *houseScore;

@property (weak, nonatomic) IBOutlet UILabel *houseCard1;
@property (weak, nonatomic) IBOutlet UILabel *houseCard2;
@property (weak, nonatomic) IBOutlet UILabel *houseCard3;
@property (weak, nonatomic) IBOutlet UILabel *houseCard4;
@property (weak, nonatomic) IBOutlet UILabel *houseCard5;

@property (weak, nonatomic) IBOutlet UILabel *houseStayed;
@property (weak, nonatomic) IBOutlet UILabel *houseBusted;
@property (weak, nonatomic) IBOutlet UILabel *houseBlackjack;

@property (weak, nonatomic) IBOutlet UILabel *houseWins;
@property (weak, nonatomic) IBOutlet UILabel *houseLosses;


@property (weak, nonatomic) IBOutlet UILabel *playerScore;

@property (weak, nonatomic) IBOutlet UILabel *playerCard1;
@property (weak, nonatomic) IBOutlet UILabel *playerCard2;
@property (weak, nonatomic) IBOutlet UILabel *playerCard3;
@property (weak, nonatomic) IBOutlet UILabel *playerCard4;
@property (weak, nonatomic) IBOutlet UILabel *playerCard5;

@property (weak, nonatomic) IBOutlet UILabel *playerStayed;
@property (weak, nonatomic) IBOutlet UILabel *playerBusted;
@property (weak, nonatomic) IBOutlet UILabel *playerBlackjack;

@property (weak, nonatomic) IBOutlet UILabel *playerWins;
@property (weak, nonatomic) IBOutlet UILabel *playerLosses;

@property (weak, nonatomic) IBOutlet UIButton *deal;
@property (weak, nonatomic) IBOutlet UIButton *hit;
@property (weak, nonatomic) IBOutlet UIButton *stay;

@property (strong, nonatomic) NSArray *houseCardViews;
@property (strong, nonatomic) NSArray *playerCardViews;

@end

@implementation FISBlackjackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.houseCardViews = @[self.houseCard1, self.houseCard2, self.houseCard3, self.houseCard4, self.houseCard5];
    self.playerCardViews = @[self.playerCard1, self.playerCard2, self.playerCard3, self.playerCard4, self.playerCard5];
    
    self.game = [[FISBlackjackGame alloc] init];
    
    [self updateViews];
    self.houseCard1.hidden = YES;
    self.deal.enabled = YES;
    self.hit.enabled = NO;
    self.stay.enabled = NO;
}

# pragma update views

- (void)updateViews {
    [self showHouseCards];
    [self showPlayerCards];
    [self showActiveStatusLabels];
    [self updatePlayerScoreLabel];
    
    if ([self playerMayHit]) {
        self.winner.hidden = YES;
        self.houseScore.hidden = YES;
    }
}

- (void)showHouseCards {
    for (NSUInteger i = 0; i < self.houseCardViews.count; i++) {
        UILabel *houseCardView = self.houseCardViews[i];
        
        if (i == 0) {
            houseCardView.text = @"❂";
        } else if (i < self.game.house.cardsInHand.count) {
            FISCard *card = self.game.house.cardsInHand[i];
            houseCardView.text = card.cardLabel;
        } else {
            houseCardView.text = @"";
        }
        
        if (houseCardView.text.length > 0) {
            houseCardView.hidden = NO;
        } else {
            houseCardView.hidden = YES;
        }
    }
}

- (void)showPlayerCards {
    for (NSUInteger i = 0; i < self.playerCardViews.count; i++) {
        UILabel *playerCardView = self.playerCardViews[i];
        
        if (i < self.game.player.cardsInHand.count) {
            FISCard *card = self.game.player.cardsInHand[i];
            playerCardView.text = card.cardLabel;
        } else {
            playerCardView.text = @"";
        }
        
        if (playerCardView.text.length > 0) {
            playerCardView.hidden = NO;
        } else {
            playerCardView.hidden = YES;
        }
    }
}

- (void)showActiveStatusLabels {
//    if (self.game.house.stayed == YES)
//    {
//        self.houseStayed.hidden = NO;
//    } else {
//        self.houseStayed.hidden = YES;
//    }

    self.houseStayed.hidden = !self.game.house.stayed;
    self.houseBusted.hidden = !self.game.house.busted;
    self.houseBlackjack.hidden = !self.game.house.blackjack;

    self.playerStayed.hidden = !self.game.player.stayed;
    self.playerBusted.hidden = !self.game.player.busted;
    self.playerBlackjack.hidden = !self.game.player.blackjack;
}

- (void)updatePlayerScoreLabel {
    NSUInteger playerScore = self.game.player.handscore;
    self.playerScore.text = [NSString stringWithFormat:@"Score: %lu", playerScore];
}

# pragma IBActions

- (IBAction)dealTapped:(id)sender {
    self.deal.enabled = NO;
    self.hit.enabled = YES;
    self.stay.enabled = YES;
    
    [self.game.deck resetDeck];
    [self.game.house resetForNewGame];
    [self.game.player resetForNewGame];
    [self.game dealNewRound];

    // current score exists in play object
    // player object exists in the game
    // game objects in self
    
    [self updateViews];
    if (![self playerMayHit]) {
        [self concludeRound];
    }
}

- (IBAction)hitTapped:(id)sender {
    [self playerTurn];
    
    if (!self.game.player.busted) {
        [self houseTurn];
    }
}

- (IBAction)stayTapped:(id)sender {
    self.game.player.stayed = YES;
    self.hit.enabled = NO;
    self.stay.enabled = NO;
    [self updateViews];
    [self concludeRound];
}

# pragma player turn

- (BOOL)playerMayHit {
    BOOL playerMayHit = !self.game.player.busted && !self.game.player.stayed && !self.game.player.blackjack;
    return playerMayHit;
}

- (void)playerTurn {
    [self.game dealCardToPlayer];
    [self updateViews];
    
    BOOL playerMayHit = [self playerMayHit];
    
    if (!playerMayHit) {
        self.hit.enabled = NO;
        self.stay.enabled = NO;
        [self concludeRound];
    }
}

- (void)houseTurn {
    [self.game processHouseTurn];
    if (self.game.house.busted) {
        [self concludeRound];
    }
}

# pragma conclude round

- (void)concludeRound {
    self.deal.enabled = YES;
    self.hit.enabled = NO;
    self.stay.enabled = NO;
    
    if (!self.game.player.busted) {
        [self finishHouseTurns];
    }
    
    [self updateViews];
    
    [self displayHouseHand];
    [self displayHouseScore];
    [self displayWinner];
    [self updateWinsAndLossesLabels];
}

- (void)finishHouseTurns {
    for (NSUInteger i = self.game.house.cardsInHand.count; i < 5; i++) {
        BOOL houseMayHit = !self.game.house.busted && !self.game.house.stayed && !self.game.house.blackjack;
        if (houseMayHit) {
            [self.game processHouseTurn];
        }
    }
}

- (void)displayHouseHand {
    FISCard *faceDownHouseCard = self.game.house.cardsInHand[0];
    self.houseCard1.text = faceDownHouseCard.cardLabel;
}

- (void)displayHouseScore {
    NSUInteger houseScore = self.game.house.handscore;
    self.houseScore.text = [NSString stringWithFormat:@"Score: %lu", houseScore];
    self.houseScore.hidden = NO;
}

- (void)displayWinner {
    BOOL houseWins = [self.game houseWins];
    [self.game incrementWinsAndLossesForHouseWins:houseWins];
    
    if (houseWins) {
        self.winner.text = @"You lost!";
    } else {
        self.winner.text = @"You win!";
    }
    self.winner.hidden = NO;
}

- (void)updateWinsAndLossesLabels {
    self.houseWins.text = [NSString stringWithFormat:@"Wins: %lu", self.game.house.wins];
    self.houseLosses.text = [NSString stringWithFormat:@"Losses: %lu", self.game.house.losses];
    self.playerWins.text = [NSString stringWithFormat:@"Wins: %lu", self.game.player.wins];
    self.playerLosses.text = [NSString stringWithFormat:@"Losses: %lu", self.game.player.losses];
}

@end
