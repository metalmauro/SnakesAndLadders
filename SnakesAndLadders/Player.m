//
//  Player.m
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-05.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName
{
    self = [super init];
    if (self) {
        NSLog(@"Enter your name:");
        _name = [self input];
        _currentSquare = 0;
        //key to represent start places of ladders or snakes
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
        //final positions relating to order of keys
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
        //make dictionaries of the keys and their final positions
        _gameLogic = [NSDictionary dictionaryWithObjects:endSquare forKeys:key];
        
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

-(NSInteger)checkSquare:(NSInteger)currentSquare
{
    //returns the NSInteger 'current'
    //only method to call this is self,
    //in order to find it's permanent position for the turn
    
    NSInteger current = currentSquare;
    
    if ([[self.gameLogic allKeys] containsObject:[NSNumber numberWithInteger:current]])
    {
        NSNumber *key = [NSNumber numberWithInteger: current];
        NSInteger set = [[self.gameLogic objectForKey:key] integerValue];
        current = set;
        
        //print if snake or ladder.
        if(set != [key integerValue])
        {
            NSInteger upOrDown = ([key intValue] - set);
            if(upOrDown < 0)
            {
                NSLog(@"%@ has hit a Ladder! Awww Yeah!!", self.name);
            }else{
                NSLog(@"%@ has hit a Snake. Sorry about your luck", self.name);
            }
        }
    }
    return current;
}


-(NSInteger)takeTurn:(NSInteger)playerLocation
{
    NSLog(@"Rolling D6");
    //the roll
    NSInteger moveCompare = [self.delegate roll];
    NSInteger currentCompare = self.currentSquare;
    
    //move the roll amount
    currentCompare += moveCompare;
    //prints as the correct value, in reference to the delegate's printed roll
    NSLog(@"%@ moved %ld squares", self.name, moveCompare);
    
    //find out if the square you moved to has a snake or ladder
    //will return NSinteger
    
    //self.currentSquare = [self checkSquare:(self.currentSquare)];
    self.currentSquare = [self checkSquare:currentCompare];
    
    //for some reason, this next line prints the current sqaure as 0
    NSLog(@"%@ moved to square %ld", self.name, self.currentSquare);
    return self.currentSquare;
}

-(NSInteger)roll
{
    return [self.delegate roll];
}

@end
