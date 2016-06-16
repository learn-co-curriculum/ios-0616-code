//
//  FISPost.m
//  playingWithObjects
//
//  Created by Joe Burgess on 6/16/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISPost.h"

@implementation FISPost

- (instancetype) init {
    return [self initWithTitle:@"EMPTY TITLE" Content:@"EMPTY CONTENT"];
}

- (instancetype)initWithTitle:(NSString *)title Content:(NSString *)content {
    self = [super init];

    if (self) {
        _title = title;
        _content = content;
        _publishDate = [NSDate date];
    }

    return self;
}

- (NSString *)displayPost {
    // Title: ASDFASDFASDF
    // Date: sometime
    //
    // asdfajoisef;aowifja;oisefjasd;flkjzxcv

    NSString *displayDate = @"";
    if (self.publishDate == nil) {
        displayDate = @"DRAFT";
    } else {
//        displayDate = [NSString stringWithFormat:@"%@",self.publishDate];

        displayDate = [self.publishDate description];
    }
     NSString *result = [NSString stringWithFormat:@"Title: %@\nDate:%@\n\n%@",self.title,displayDate,self.content];
       return result;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ | %@",self.title,self.content];
}

- (void)convertToDraft {
    self.publishDate = nil;
}

- (void) publishPost {
    self.publishDate = [NSDate date];
}
@end
