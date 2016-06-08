//
//  Feed.m
//  playingWithObjects
//
//  Created by Joe Burgess on 6/8/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "Feed.h"

@implementation Feed

-(NSString *)greetUser {
    return @"Welcome to Wordpress";
}

- (void)displayBlogPosts {
    for (NSString *post in self.posts) {
        NSLog(@"%@",post);
    }
}

-(NSString *)longestPost
{
    NSString *longestPost = @"";

    for (NSString *post in self.posts) {

        if ([post length]>[longestPost length]) {
            longestPost = post;
        }
    }

    return longestPost;
}


@end
