//
//  DetailViewController.m
//  playingWithViews
//
//  Created by Joe Burgess on 6/17/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *introLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"From Detail VC: %@",self.userNameToDisplay);
    self.introLabel.text = self.userNameToDisplay;

    // Do any additional setup after loading the view.
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
- (IBAction)rewindTapped:(id)sender {
    NSLog(@"REWIND");

}
- (IBAction)dismissVCTapped:(UIButton *)sender {

    [self.navigationController popViewControllerAnimated:YES];
}

@end
