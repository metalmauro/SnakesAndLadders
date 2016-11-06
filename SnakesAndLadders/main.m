//
//  main.m
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-05.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "Player.h"
#import "PlayerManager.h"
#import "DSix.h"
#import <Foundation/Foundation.h>
#import <stdlib.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        PlayerManager *GM = [[PlayerManager alloc]init];
        Player *player1 = [[Player alloc]initWithName];
        Player *player2 = [[Player alloc]initWithName];
        DSix *first  = [[DSix alloc]init];
        DSix *second = [[DSix alloc]init];
        player1.delegate = first;
        player2.delegate = second;
        GM.player1 = player1;
        GM.player2 = player2;
        
        NSString *gameStatus = @"";
        while([gameStatus isEqualToString:@"quit"]==FALSE)
        {
            while(player1.currentSquare < 100 || player2.currentSquare < 100)
            {
                [GM theTurn];
                NSLog(@"Type 'quit' to stop the game here. hit return to keep going");
                gameStatus = [GM input];
            }
            if(player1.currentSquare >=100)
            {
                NSLog(@"Player 1 has won!");
                NSLog(@"Player 1 has won!");
                break;
            }
            if(player2.currentSquare >=100)
            {
                NSLog(@"Player 2 has won!");
                NSLog(@"Player 2 has won!");
                break;
            }
        }
    }
    return 0;
}
