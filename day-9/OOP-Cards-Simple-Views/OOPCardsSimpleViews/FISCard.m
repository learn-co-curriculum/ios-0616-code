//  FISCard.m

#import "FISCard.h"

@interface FISCard ()

@property (strong, nonatomic, readwrite) NSString *suit;
@property (strong, nonatomic, readwrite) NSString *rank;
@property (strong, nonatomic, readwrite) NSString *cardLabel;
@property (nonatomic, readwrite) NSUInteger cardValue;

@end

@implementation FISCard

+ (NSArray *)validSuits {
    return @[@"♠",@"♥",@"♣",@"♦"];
}

+ (NSArray *)validRanks {
    return @[ @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (instancetype)init {
    self = [self initWithSuit:@"!" rank:@"N"];
    return self;
}

- (instancetype)initWithSuit:(NSString *)suit rank:(NSString *)rank {
    
    self = [super init];
    
    if (self) {
        _suit = suit;
        _rank = rank;
        _cardLabel = [self cardLabelForSuitAndRank];
        _cardValue = [self cardValueForRank];
    }
    
    return self;
}

- (NSString *)cardLabelForSuitAndRank {
    NSString *cardLabel = [NSString stringWithFormat:@"%@%@", self.suit, self.rank];
    return cardLabel;
}

- (NSUInteger)cardValueForRank {
    NSArray *validRanks = [FISCard validRanks];
    
    NSUInteger index = [validRanks indexOfObject:self.rank];
    NSUInteger cardValue = 0;
    
    if (index <= 9) {
        cardValue = index + 1;
    } else {
        cardValue = 10;
    }
    
    return cardValue;
}

- (NSString *)description {
    return self.cardLabel;
}

@end
