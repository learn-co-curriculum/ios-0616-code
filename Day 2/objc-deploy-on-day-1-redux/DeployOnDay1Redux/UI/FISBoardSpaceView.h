//
//  FISBoardSpaceView.h
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface FISBoardSpaceView : UIControl

@property (nonatomic, assign) IBInspectable NSUInteger column;
@property (nonatomic, assign) IBInspectable NSUInteger row;

@property (nonatomic, copy) NSString *symbol;

@end
