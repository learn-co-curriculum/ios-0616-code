//
//  Feed.h
//  playingWithObjects
//
//  Created by Joe Burgess on 6/8/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

@property (strong, nonatomic) NSArray *posts;

- (NSString *) greetUser;

- (void) displayBlogPosts;
- (NSString *) longestPost;



@end
