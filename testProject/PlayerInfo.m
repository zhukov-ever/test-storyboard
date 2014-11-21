//
//  Player.m
//  testProject
//
//  Created by Nikita on 20/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import "PlayerInfo.h"

@implementation PlayerInfo


+(PlayerInfo*) playerWithName:(NSString*)name
                         game:(NSString*)game
                       rating:(int)rating
{
    PlayerInfo* _info = [PlayerInfo new];
    
    _info.name = name;
    _info.game = game;
    _info.rating = rating;
    
    return _info;
}

@end
