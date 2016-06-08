//
//  FISGameOverViewController.h
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FISGameOverViewController;

@protocol FISGameOverViewControllerDelegate <NSObject>

@required
-(void)gameOverViewControllerWillDismiss:(FISGameOverViewController *)gameOverViewController;

@end


@interface FISGameOverViewController : UIViewController

@property (nonatomic, copy) NSString *winningPlayerSymbol;
@property (nonatomic, weak) id<FISGameOverViewControllerDelegate> delegate;

@end
