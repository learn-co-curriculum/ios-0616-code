//
//  FISBlog.h
//  playingWithObjects
//
//  Created by Joe Burgess on 6/16/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISBlog : NSObject

@property (strong, nonatomic) NSMutableArray *posts;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *title;


@end
