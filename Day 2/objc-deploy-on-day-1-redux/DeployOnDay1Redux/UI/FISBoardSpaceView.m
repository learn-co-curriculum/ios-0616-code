//
//  FISBoardSpaceView.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISBoardSpaceView.h"
#import <FontAwesomeKit/FAKIonIcons.h>
#import <Masonry/Masonry.h>


@interface FISBoardSpaceView ()

@property (nonatomic, strong) UILabel *symbolLabel;

@end


@implementation FISBoardSpaceView

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self commonInit];
    }

    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self commonInit];
    }

    return self;
}

-(void)commonInit
{
    _symbolLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_symbolLabel];

    [_symbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

-(NSAttributedString *)attributedStringForSymbol:(NSString *)symbol
{
    if(!symbol || symbol.length == 0) {
        return nil;
    }

    CGFloat iconSize = self.frame.size.height;

    FAKIcon *icon;
    UIColor *color;

    if([_symbol isEqualToString:@"X"]) {
        icon = [FAKIonIcons androidCloseIconWithSize:iconSize];
        color = [UIColor colorWithRed:0.937 green:0.345 blue:0.357 alpha:1.000];
    }
    else if([_symbol isEqualToString:@"O"]) {
        icon = [FAKIonIcons androidRadioButtonOffIconWithSize:iconSize * 0.90]; // Fudging for optical size
        color = [UIColor colorWithRed:0.078 green:0.698 blue:0.851 alpha:1.000];
    }
    else {
        icon = [FAKIonIcons bugIconWithSize:iconSize];
        color = [UIColor colorWithRed:0.502 green:1.000 blue:0.000 alpha:1.000];
    }

    [icon addAttribute:NSForegroundColorAttributeName value:color];

    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [icon addAttribute:NSParagraphStyleAttributeName value:paragraphStyle];

    return icon.attributedString;
}

-(void)setSymbol:(NSString *)symbol
{
    _symbol = [symbol copy];

    self.symbolLabel.attributedText = [self attributedStringForSymbol:symbol];
}

@end
