//
//  ViewController.m
//  playingWithAutoLayout
//
//  Created by Joe Burgess on 6/27/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *centerLabel;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *redBox;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.bottomLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.bottomLabel removeConstraints:self.bottomLabel.constraints];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    self.centerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.centerLabel removeConstraints:self.centerLabel.constraints];
    self.myTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.myTextField removeConstraints:self.myTextField.constraints];
    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.loginButton removeConstraints:self.loginButton.constraints];
    self.redBox.translatesAutoresizingMaskIntoConstraints = NO;
    [self.redBox removeConstraints:self.redBox.constraints];

    [self.loginButton.topAnchor constraintEqualToAnchor:self.myTextField.bottomAnchor constant:10].active=YES;
    [self.loginButton.centerXAnchor constraintEqualToAnchor:self.myTextField.centerXAnchor].active=YES;

    [self.redBox.topAnchor constraintEqualToAnchor:self.view.topAnchor].active=YES;
    [self.redBox.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active=YES;
    [self.redBox.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0].active=YES;
    [self.redBox.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.25].active=YES;
//    [self.redBox.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor].active=YES;
   // [self.redBox.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active=YES;

    //[self.redBox.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.5].active=YES;


    [self.myTextField.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20].active=YES;
    [self.myTextField.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active=YES;

    [self.myTextField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-40].active=YES;


    [self.bottomLabel.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0].active = YES;
    [self.bottomLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;

    [self.centerLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active=YES;
    [self.centerLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active=YES;


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
