//
//  PlayerCell.h
//  testProject
//
//  Created by Nikita on 20/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *labelName;
@property (nonatomic, weak) IBOutlet UILabel *labelGame;
@property (nonatomic, weak) IBOutlet UIImageView *imageViewRating;

@end
