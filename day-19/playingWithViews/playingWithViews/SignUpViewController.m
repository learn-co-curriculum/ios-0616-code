//
//  SignUpViewController.m
//  playingWithViews
//
//  Created by Joe Burgess on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "SignUpViewController.h"
#import "FISUserAccount.h"
#import "UsersDataStore.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *confirmationField;
@property (strong, nonatomic) UsersDataStore *dataStore;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataStore = [UsersDataStore sharedManager];
    // Do any additional setup after loading the view.
}
- (IBAction)saveTapped:(id)sender {
    FISUserAccount *newAccount = [[FISUserAccount alloc] init];
    newAccount.username = self.userNameField.text;
    newAccount.password = self.passwordField.text;
    [self.dataStore.validUsers addObject:newAccount];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
