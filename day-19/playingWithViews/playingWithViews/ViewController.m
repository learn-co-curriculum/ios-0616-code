//
//  ViewController.m
//  playingWithViews
//
//  Created by Joe Burgess on 6/15/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "FISUserAccount.h"
#import "UsersDataStore.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topRightLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (strong, nonatomic) UsersDataStore *dataStore;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.dataStore = [UsersDataStore sharedManager];


    FISUserAccount *sergey = [[FISUserAccount alloc] init];
    sergey.username=@"sergey";
    sergey.password = @"sergeyspassword";

    FISUserAccount *ken = [[FISUserAccount alloc] init];
    ken.username=@"ken";
    ken.password = @"kenspassword";


    [self.dataStore.validUsers addObject:ken];
    [self.dataStore.validUsers addObject:sergey];


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    NSInteger userCount = self.dataStore.validUsers.count;

    self.topRightLabel.text = [NSString stringWithFormat:@"%i",userCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"login"]) {
        NSString *userName = self.nameTextField.text;
        NSString *password = self.passwordField.text;


        BOOL found = NO;
        for (FISUserAccount *user in self.dataStore.validUsers) {
            if ([user.username isEqualToString:userName] && [user.password isEqualToString:password]) {
                found = YES;
                break;
            }
        }


        DetailViewController *detailVC = segue.destinationViewController;

        if (found) {
            detailVC.userNameToDisplay = userName;
        } else {
            detailVC.userNameToDisplay = @"USER NOT FOUND";
        }
    }

}


@end
