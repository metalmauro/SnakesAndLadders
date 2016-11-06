//
//  Player.m
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-05.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        NSArray *key = @[[NSNumber numberWithInt:4],
                         [NSNumber numberWithInt:9],
                         [NSNumber numberWithInt:17],
                         [NSNumber numberWithInt:20],
                         [NSNumber numberWithInt:28],
                         [NSNumber numberWithInt:40],
                         [NSNumber numberWithInt:51],
                         [NSNumber numberWithInt:64],
                         [NSNumber numberWithInt:63],
                         [NSNumber numberWithInt:89],
                         [NSNumber numberWithInt:95],
                         [NSNumber numberWithInt:99]
                         ];
        NSArray *endSquare = @[[NSNumber numberWithInt:14],
                               [NSNumber numberWithInt:31],
                               [NSNumber numberWithInt:7],
                               [NSNumber numberWithInt:38],
                               [NSNumber numberWithInt:84],
                               [NSNumber numberWithInt:59],
                               [NSNumber numberWithInt:67],
                               [NSNumber numberWithInt:60],
                               [NSNumber numberWithInt:81],
                               [NSNumber numberWithInt:26],
                               [NSNumber numberWithInt:73],
                               [NSNumber numberWithInt:78],
                               ];
        _gameLogic = [NSDictionary dictionaryWithObjects:endSquare forKeys:key];
        
    }
    return self;
}

-(void)checkSquare
{
    NSInteger current = self.currentSquare;
    
    if ([[self.gameLogic allKeys] containsObject:[NSNumber numberWithInteger:current]])
    {
        NSNumber *key = [NSNumber numberWithInteger: current];
        NSInteger set = [[self.gameLogic objectForKey:key] integerValue];
        current = set;
        if(set == [key integerValue])
        {
            NSInteger upOrDown = ([key intValue] - set);
            if(upOrDown < 0)
            {
                NSLog(@"Player has hit a Ladder! Awww Yeah!!");
            }else{
                NSLog(@"Player has hit a Snake. Sorry about your luck");
            }
            
        }
    }
    self.currentSquare = current;
}

-(void)takeTurn;
{
    NSLog(@"Rolling D6");
    NSInteger moveCompare = [self.delegate roll];
    NSInteger currentCompare = self.currentSquare;
    
    currentCompare += moveCompare;
    NSLog(@"Player moved %ld squares", moveCompare);
    [self checkSquare];
    NSLog(@"Player moved to square %ld", self.currentSquare);
}

@end
