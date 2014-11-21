//
//  GamesViewController.m
//  testProject
//
//  Created by Nikita on 21/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import "GamePickerViewController.h"
#import "GamesManager.h"

@interface GamePickerViewController ()

@end

@implementation GamePickerViewController
{
    NSInteger m_selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    m_selectedIndex = NSNotFound;
    
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
    return [[GamesManager shared].gamesArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* _cell = [tableView dequeueReusableCellWithIdentifier:@"gameCell"];
    _cell.textLabel.text = [GamesManager shared].gamesArray[indexPath.row];
    
    if (indexPath.row == m_selectedIndex) {
        _cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        _cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return _cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (m_selectedIndex != NSNotFound)
    {
        UITableViewCell *_deselectCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:m_selectedIndex inSection:0]];
        _deselectCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UITableViewCell *_cell = [tableView cellForRowAtIndexPath:indexPath];
    _cell.accessoryType = UITableViewCellAccessoryCheckmark;
    m_selectedIndex = indexPath.row;
    
    NSString* _gameName = [GamesManager shared].gamesArray[indexPath.row];
    [self.delegate gamePickerViewController:self didSelectGame:_gameName];
}

@end
