//
//  Card.m
//  Matchismo
//
//  Created by Kigen on 1/23/14.
//  Copyright (c) 2014 MTD8506. All rights reserved.
//

#import "Card.h"

@implementation Card
-(int)match:(NSArray *)otherCards{
    int score = 0;
    
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    
    
   // NSMutableDictionary *test = [[NSMutableDictionary alloc] init];
    return score;
}

@end
