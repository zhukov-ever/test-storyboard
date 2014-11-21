//
//  PlayersManager.m
//  testProject
//
//  Created by Nikita on 20/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import "PlayersManager.h"

@implementation PlayersManager
@synthesize playersArray = m_playersArray;

- (id) init
{
    if (self = [super init])
    {
        [self createPlayers];
    }
    return self;
}

static PlayersManager* m_shared;
+ (PlayersManager*)shared
{
    if (!m_shared)
    {
        m_shared = [PlayersManager new];
    }
    return m_shared;
}

- (NSString*)imageNameForRating:(int)rating;
{
    switch (rating) {
        case 1: return @"1StarSmall";
        case 2: return @"2StarsSmall";
        case 3: return @"3StarsSmall";
        case 4: return @"4StarsSmall";
        case 5: return @"5StarsSmall";
    }
    return nil;
}

- (void) addPlayer:(PlayerInfo*)player
{
    m_playersArray = [m_playersArray arrayByAddingObject:player];
}


#pragma mark - private

- (void) createPlayers
{
    self.playersArray =
    @[
      [PlayerInfo playerWithName:@"Billy Bob" game:@"FTW Game" rating:4],
      [PlayerInfo playerWithName:@"Timmy Tim" game:@"Tank it with your face!" rating:3],
      [PlayerInfo playerWithName:@"Allona Miu" game:@"Private" rating:5],
      ];
}

-(NSArray *)playersArray
{
    if (!m_playersArray)
    {
        m_playersArray = @[];
    }
    return m_playersArray;
}

@end
