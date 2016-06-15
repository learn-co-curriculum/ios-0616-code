//
//  ViewController.m
//  playingWithViews
//
//  Created by Joe Burgess on 6/15/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topRightLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    NSLog(@"Did I work?");
    self.topRightLabel.text = self.nameTextField.text;
    self.nameTextField.text = @"";
}


@end
