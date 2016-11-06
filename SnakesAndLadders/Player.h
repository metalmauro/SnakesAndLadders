//
//  Player.h
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-05.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "PlayerManager.h"
#import <Foundation/Foundation.h>
@class DSix;

//D6 protocol
@protocol Die <NSObject>
-(NSInteger)roll;
@end

@interface Player : NSObject <GamePlayer>

@property id<Die> delegate;
@property NSString *name;
@property (nonatomic) NSInteger currentSquare;
@property NSDictionary *gameLogic;

-(instancetype)initWithName;
-(NSInteger)takeTurn:(NSInteger)playerLocation;
-(NSInteger)roll;

@end
