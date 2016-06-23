//
//  JoesTableViewController.m
//  playingWithViews
//
//  Created by Joe Burgess on 6/21/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "JoesTableViewController.h"
#import "ViewController.h"
#import "MyImageTableViewCell.h"

@interface JoesTableViewController ()

@property (strong, nonatomic) NSMutableArray *students;
@end

@implementation JoesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.students = [[NSMutableArray alloc] init];
    [self.students addObject:@"Jenny"];
    [self.students addObject:@"Zain"];
    [self.students addObject:@"Salmaan"];
    [self.students addObject:@"Max"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  //  NSLog(@"number of sections called");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  //  NSLog(@"rows in section called");
//    return self.students.count;
    return 100;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row %2 ==0) {
        MyImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
        //  NSString *student = self.students[indexPath.row];

        // NSLog(@"cellForRowAtIndexPath called %i, memory address: %@ ", indexPath.row,cell);
        cell.myImageView.image = [UIImage imageNamed:@"classImage.jpg"];
         return cell;

    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
        //  NSString *student = self.students[indexPath.row];

        // NSLog(@"cellForRowAtIndexPath called %i, memory address: %@ ", indexPath.row,cell);
        cell.textLabel.text = [NSString stringWithFormat:@"%i",indexPath.row];
        return cell;

    }

    // Assume there is a class called FBFeedItem which has a method that returns @"image", @"video", or @"text". That method is called "feedType"
    // FBFeedITem *item = self.feedItems[indexPath.row]
    // if ([item feedType] == @"image") {
    //    //deque imageCell
    //      Set image
    //      return cell

    // Configure the cell...
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row Selected");
    NSLog(@"%i",indexPath.row);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ViewController *vc = segue.destinationViewController;
    NSIndexPath *selectedRow = [self.tableView indexPathForSelectedRow];

    vc.selectedItem = [NSString stringWithFormat:@"%i",selectedRow.row];
    
}


@end
