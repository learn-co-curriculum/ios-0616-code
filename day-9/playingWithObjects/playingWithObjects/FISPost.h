//
//  FISPost.h
//  playingWithObjects
//
//  Created by Joe Burgess on 6/16/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISPost : NSObject

@property (strong, nonatomic) NSDate *publishDate;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *content;

- (instancetype) initWithTitle: (NSString *)title Content:(NSString *)content;

- (NSString *)displayPost;

- (void) convertToDraft;

@end
