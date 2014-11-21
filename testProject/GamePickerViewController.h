//
//  GamesViewController.h
//  testProject
//
//  Created by Nikita on 21/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GamePickerViewControllerDelegate;
@interface GamePickerViewController : UITableViewController

@property (nonatomic, weak) id<GamePickerViewControllerDelegate> delegate;

@end

@protocol GamePickerViewControllerDelegate <NSObject>

- (void)gamePickerViewController:(GamePickerViewController*)controller
                   didSelectGame:(NSString*)game;

@end