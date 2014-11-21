//
//  Player.h
//  testProject
//
//  Created by Nikita on 20/11/14.
//  Copyright (c) 2014 Nikita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerInfo : NSObject

+(PlayerInfo*) playerWithName:(NSString*)name
                         game:(NSString*)game
                       rating:(int)rating;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;

@end
