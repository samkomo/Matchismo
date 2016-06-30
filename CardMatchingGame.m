//
//  CardMatchingGames.m
//  Matchismo
//
//  Created by ilabafrica on 1/24/14.
//  Copyright (c) 2014 MTD8506. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(nonatomic, readwrite)NSInteger score;
@property(nonatomic, strong)NSMutableArray *cards; //Array of cards
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    
    return  _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    
    self = [super init]; //Super's designated initializer
    
    if(self){
        
        for(int i = 0; i<count; i++){
            
        Card *card = [deck drawRandomCard];
        
        if(card){
           [self.cards addObject:card];
        }else{
            self = nil;
            break;
        }
        }
    }
    
    return  self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return (index<[self.cards count] ? self.cards[index] : nil);
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index{
    
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched){
        //Only choose Unmatched cards
        card.chosen = NO;
    }else{
        //Match cards against other chosen cards
        for(Card *otherCard in self.cards){
            if(otherCard.isChosen && !otherCard.isMatched){
                int matchScore = [card match:@[otherCard]];
                
                if(matchScore){
                    self.score += matchScore * MATCH_BONUS;
                    otherCard.matched = YES;
                    card.matched = YES;
                }else{
                    self.score -= MISMATCH_PENALTY;
                    otherCard.chosen = NO;
                }
                break; //can only choose 2 cards for now
            }
            
        }
        
        
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
}


@end
