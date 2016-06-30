//
//  Deck.h
//  Matchismo
//
//  Created by ilabafrica on 1/24/14.
//  Copyright (c) 2014 MTD8506. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard: (Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;
@end
