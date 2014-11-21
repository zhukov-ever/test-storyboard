//
//  AddPlayerViewController.h
//  testProject
//
//  Created by Nikita on 20/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePickerViewController.h"

@protocol AddPlayerViewControllerDelegate;
@interface AddPlayerViewController : UITableViewController <GamePickerViewControllerDelegate>

- (IBAction)doneHandler:(id)sender;
- (IBAction)cancelHandler:(id)sender;

@property (nonatomic, weak) id<AddPlayerViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UILabel *labelGame;


@end


@protocol AddPlayerViewControllerDelegate <NSObject>
- (void)addPlayerViewControllerDidCancel:(AddPlayerViewController *)controller;
- (void)addPlayerViewControllerDidSave:(AddPlayerViewController *)controller;
@end