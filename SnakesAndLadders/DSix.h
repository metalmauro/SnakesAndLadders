//
//  DSix.h
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-05.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "Player.h"
#import <Foundation/Foundation.h>
#import <stdlib.h>

@interface DSix : NSObject <Die>

@property (nonatomic, strong) NSArray *d6Values;
@property (nonatomic, strong) NSString *rollResult;

-(instancetype)init;
-(NSInteger)roll;

@end
