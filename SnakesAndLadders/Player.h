//
//  Player.h
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-05.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import <Foundation/Foundation.h>
@class DSix;

@protocol Die <NSObject>
-(NSInteger)roll;
@end

@interface Player : NSObject

@property id<Die> delegate;

@property (nonatomic) NSInteger currentSquare;
@property NSDictionary *gameLogic;

-(void)takeTurn;

@end
