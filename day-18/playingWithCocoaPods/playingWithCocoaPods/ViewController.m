//
//  ViewController.m
//  playingWithCocoaPods
//
//  Created by Joe Burgess on 6/29/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "ViewController.h"
#import "MarqueeLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MarqueeLabel *myMarquee;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myMarquee.scrollDuration=1.0;
    self.myMarquee.unpauseLabel;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
