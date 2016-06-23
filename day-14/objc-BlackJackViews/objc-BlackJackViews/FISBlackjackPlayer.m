//  FISBlackjackPlayer.m

#import "FISBlackjackPlayer.h"

@interface FISBlackjackPlayer ()

@end

@implementation FISBlackjackPlayer

- (instancetype)init {
    self = [self initWithName:@""];
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    
    self = [super init];
    
    if (self) {
        _name = name;
        _cardsInHand = [[NSMutableArray alloc] init];
        _handscore = 0;
        _aceInHand = NO;
        _blackjack = NO;
        _busted = NO;
        _stayed = NO;
        
        _wins = 0;
        _losses = 0;
    }
    
    return self;
}

- (void)resetForNewGame {
    [self.cardsInHand removeAllObjects];
    self.handscore = 0;
    
    self.aceInHand = NO;
    self.blackjack = NO;
    self.busted = NO;
    self.stayed = NO;
}

- (void)acceptCard:(FISCard *)card {
    [self.cardsInHand addObject:card];
    [self scoreHand];
}

- (void)scoreHand {
    NSUInteger score = 0;
    
    for (FISCard *card in self.cardsInHand) {
        score += card.cardValue;
        
        if ([card.rank isEqualToString:@"A"]) {
            self.aceInHand = YES;
        }
    }
    
    if (self.aceInHand && score <= 11) {
        score += 10;
    }
    
    self.handscore = score;
    
    [self evaluateBlackjack];
    [self evaluateBusted];
}

- (void)evaluateBlackjack {
    if (self.cardsInHand.count == 2 && self.handscore == 21) {
        self.blackjack = YES;
    }
}

- (void)evaluateBusted {
    if (self.handscore > 21) {
        self.busted = YES;
    }
}

- (BOOL)shouldHit {
    NSUInteger maxScoreToHit = 17;
    
    if (self.handscore > maxScoreToHit) {
        self.stayed = YES;
        return NO;
    }
    
    return YES;
}

- (NSString *)description {
    NSMutableString *result = [[NSMutableString alloc] initWithString:@"FISBlackjackPlayer:"];
    [result appendFormat:@"\n  name: %@", self.name];
    
    [result appendString:@"\n  cards:"];
    for (FISCard *card in self.cardsInHand) {
        [result appendFormat:@" %@", card.description];
    }
    
    [result appendFormat:@"\n  handscore  : %lu", self.handscore];
    [result appendFormat:@"\n  ace in hand: %d", self.aceInHand];
    [result appendFormat:@"\n  blackjack  : %d", self.blackjack];
    [result appendFormat:@"\n  busted     : %d", self.busted];
    [result appendFormat:@"\n  stayed     : %d", self.stayed];
    [result appendFormat:@"\n  wins  : %lu", self.wins];
    [result appendFormat:@"\n  losses: %lu", self.losses];
    
    return result;
}

@end
