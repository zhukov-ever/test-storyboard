//
//  PlayersManager.h
//  testProject
//
//  Created by Nikita on 20/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerInfo.h"

@interface PlayersManager : NSObject

+ (PlayersManager*)shared;
- (NSString*)imageNameForRating:(int)rating;
- (void) addPlayer:(PlayerInfo*)player;

@property (nonatomic, strong) NSArray* playersArray;


@end
