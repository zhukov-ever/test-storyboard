//
//  GamesManager.m
//  testProject
//
//  Created by Nikita on 21/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import "GamesManager.h"

@implementation GamesManager

static GamesManager* m_shared;
+(GamesManager*)shared
{
    if (!m_shared)
    {
        m_shared = [GamesManager new];
    }
    return m_shared;
}

-(NSArray*)gamesArray
{
    return @[
             @"Awesome game",
             @"private.",
             @"Play with cat"
             ];
}

@end
