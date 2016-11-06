//
//  PlayerManager.h
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-06.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

//protocol for controlling players
@protocol GamePlayer <NSObject>
@property NSString *name;
@property (nonatomic) NSInteger currentSquare;
-(NSInteger)takeTurn:(NSInteger)playerLocation;
-(NSInteger)roll;
@end

@interface PlayerManager : NSObject
@property id<GamePlayer> player1;
@property id<GamePlayer> player2;
@property (nonatomic) NSInteger p1Loc;
@property (nonatomic) NSInteger p2Loc;
@property (nonatomic) NSInteger turnNumber;
@property NSMutableArray <GamePlayer> *turnOrder;
-(NSString *)input;
-(void)theTurn;

@end
