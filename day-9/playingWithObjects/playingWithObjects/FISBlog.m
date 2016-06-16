//
//  FISBlog.m
//  playingWithObjects
//
//  Created by Joe Burgess on 6/16/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISBlog.h"

@implementation FISBlog

- (instancetype)init {
    self = [super init];

    if (self) {
        _posts = [[NSMutableArray alloc] init];
        _title = @"";
        _author = @"";
    }

    return self;
}
@end
