//
//  PlayersViewController.m
//  testProject
//
//  Created by Nikita on 20/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import "PlayersViewController.h"
#import "PlayersManager.h"
#import "PlayerCell.h"

@interface PlayersViewController ()

@end

@implementation PlayersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[PlayersManager shared].playersArray count];
}


static NSString* m_cellIdentifier = @"PlayerCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerCell *_cell = (PlayerCell*)[tableView dequeueReusableCellWithIdentifier:m_cellIdentifier
                                                                    forIndexPath:indexPath];
    
    PlayerInfo* _player = [PlayersManager shared].playersArray[indexPath.row];
    
    _cell.labelName.text = _player.name;
    _cell.labelGame.text = _player.game;
    _cell.imageViewRating.image = [UIImage imageNamed:[[PlayersManager shared] imageNameForRating:_player.rating]];
    
    return _cell;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddPlayer"])
    {
        UINavigationController *_nc = segue.destinationViewController;
        AddPlayerViewController *_viewController = [_nc viewControllers][0];
        _viewController.delegate = self;
    }
}

- (void)addPlayerViewControllerDidSave:(AddPlayerViewController *)controller
{
    NSIndexPath *_indexPath = [NSIndexPath indexPathForRow:([[PlayersManager shared].playersArray count] - 1)
                                                 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[_indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addPlayerViewControllerDidCancel:(AddPlayerViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
