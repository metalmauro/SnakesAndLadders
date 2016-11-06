//
//  main.m
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-05.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "Player.h"
#import "DSix.h"
#import <Foundation/Foundation.h>
#import <stdlib.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Player *matt = [[Player alloc]init];
        DSix *first  = [[DSix alloc]init];
        matt.delegate = first;
        
        while(matt.currentSquare < 100)
        {
            char inputChars[255];
            
            NSLog(@"What would you like to do? \n '(r)oll' \n or '(q)uit'");
            fgets(inputChars, 255, stdin);
            strtok(inputChars, "\n");
            NSString *inputStr = [NSString stringWithUTF8String:inputChars];
            
            if ([inputStr isEqualToString:@"roll"] || [inputStr containsString:@"r"])
            {
                [matt takeTurn];
            }if ([inputStr isEqualToString:@"quit"] || [inputStr containsString:@"q"])
            {
                break;
            }
        }
        NSLog(@"You've made it to the end!");
    }
    return 0;
}
