//
//  ViewController.m
//  fontingawesome
//
//  Created by Joe Burgess on 6/29/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "ViewController.h"
#import "FontAwesomeKit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error;
    FAKFontAwesome *starIcon = [FAKFontAwesome starHalfIconWithSize:15];
    self.myLabel.attributedText = [starIcon attributedString];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
