//
//  PlayerManager.m
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-06.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        _turnNumber = 0;
        _turnOrder = [NSMutableArray <GamePlayer> new];
        _p1Loc = 0;
        _p2Loc = 0;
    }
    return self;
}

-(NSString *)input
{
    
    char inputChars[255];
    fgets(inputChars, 255, stdin);
    strtok(inputChars, "\n");
    NSString *inputStr = [NSString stringWithUTF8String:inputChars];
    return inputStr;
}

-(void)theTurn
{
    if(self.turnNumber ==0)
    {
        NSLog(@"First, we must determine the turn order");
        NSInteger p1Roll = 0;
        NSInteger p2Roll = 0;
        NSLog(@"Player 1 \n Please type (r) to roll");
        if ([[self input] containsString:@"r"])
        {
            p1Roll = [self.player1 roll];
        }
        NSLog(@"Player 2 \n Please type (r) to roll");
        if ([[self input] containsString:@"r"])
        {
            p2Roll = [self.player2 roll];
        }
        if(p1Roll > p2Roll)
        {
            [self.turnOrder addObject:@"Player 1"];
            [self.turnOrder addObject:@"Player 2"];
        }
        else{
            [self.turnOrder addObject:@"Player 2"];
            [self.turnOrder addObject:@"Player 1"];
        }
    }else{
        if([[self.turnOrder objectAtIndex:0] isEqualToString:@"Player 1"])
        {
            NSLog(@"Player 1 \n Please type (r) to roll");
            if ([[self input] containsString:@"r"])
            {
                self.p1Loc = [self.player1 takeTurn:self.p1Loc];
            }
            NSLog(@"Player 2 \n Please type (r) to roll");
            if ([[self input] containsString:@"r"])
            {
                self.p2Loc = [self.player2 takeTurn:self.p2Loc];
            }
            
        }else{
            NSLog(@"Player 2 \n Please type (r) to roll");
            if ([[self input] containsString:@"r"])
            {
                self.p2Loc = [self.player2 takeTurn:self.p2Loc];
            }
            NSLog(@"Player 1 \n Please type (r) to roll");
            if ([[self input] containsString:@"r"])
            {
                self.p1Loc = [self.player1 takeTurn:self.p1Loc];
            }
        }
        
        
    }
    self.turnNumber++;
}

@end
