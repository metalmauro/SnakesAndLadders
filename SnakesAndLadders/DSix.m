//
//  DSix.m
//  SnakesAndLadders
//
//  Created by Matthew Mauro on 2016-11-05.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "DSix.h"

@implementation DSix

-(instancetype)init
{
    self = [super init];
    if (self) {
        _d6Values = @[@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
        _rollResult = @"";
    }
    return self;
}

-(NSInteger)roll
{
    int rollV = arc4random_uniform(6);
    self.rollResult = [self.d6Values objectAtIndex:rollV];
    NSLog(@"%@", self.rollResult);
    rollV++;
    return rollV;
}
@end
