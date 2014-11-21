//
//  AddPlayerViewController.m
//  testProject
//
//  Created by Nikita on 20/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import "AddPlayerViewController.h"
#import "PlayersManager.h"

@interface AddPlayerViewController ()
{
    BOOL m_isGameChosen;
}

@end

@implementation AddPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    m_isGameChosen = NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ChooseGame"])
    {
        GamePickerViewController *_viewController = segue.destinationViewController;
        _viewController.delegate = self;
    }
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.textFieldName becomeFirstResponder];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (IBAction)doneHandler:(id)sender
{
    if (m_isGameChosen)
    {
        [[PlayersManager shared] addPlayer:[PlayerInfo playerWithName:self.textFieldName.text
                                                                 game:self.labelGame.text
                                                               rating:1]];
        [self.delegate addPlayerViewControllerDidSave:self];
    }
    else
    {
        [[[UIAlertView alloc] initWithTitle:nil message:@"You have to choose game" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
}

- (IBAction)cancelHandler:(id)sender
{
    [self.delegate addPlayerViewControllerDidCancel:self];
}


#pragma mark - GamePickerViewControllerDelegate

- (void)gamePickerViewController:(GamePickerViewController*)controller
                   didSelectGame:(NSString*)game
{
    m_isGameChosen = YES;
    self.labelGame.text = game;
}


@end
