//
//  PlayingCard.h
//  Matchismo
//
//  Created by ilabafrica on 1/24/14.
//  Copyright (c) 2014 MTD8506. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(nonatomic, strong)NSString *suit;
@property(nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
