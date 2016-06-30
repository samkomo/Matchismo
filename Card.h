//
//  Card.h
//  Matchismo
//
//  Created by Kigen on 1/23/14.
//  Copyright (c) 2014 MTD8506. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(nonatomic, strong)NSString *contents;
@property(nonatomic, getter = isChosen)BOOL chosen;
@property(nonatomic, getter = isMatched)BOOL matched;

-(int)match:(NSArray *)otherCards;
@end
