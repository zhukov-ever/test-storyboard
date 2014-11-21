//
//  GamesManager.h
//  testProject
//
//  Created by Nikita on 21/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GamesManager : NSObject

+(GamesManager*)shared;

@property (nonatomic, readonly) NSArray* gamesArray;

@end
