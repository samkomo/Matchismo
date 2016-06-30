//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Kigen on 1/23/14.
//  Copyright (c) 2014 MTD8506. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardGameViewController ()

@property(nonatomic, strong)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation CardGameViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
    return _game;
}



-(Deck *)createDeck{
    return  [[PlayingCardDeck alloc] init];
}



- (IBAction)touchCardButton:(UIButton *)sender {
    
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    
    [self.game chooseCardAtIndex:chosenButtonIndex];
    
    [self updateUI];
    
    //NSString *myString =@"♥";
    
}



-(void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        
        int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton];
        
        //NSLog(@"Card button index: %i", cardButtonIndex);
        
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
    
}

-(NSString *)titleForCard: (Card *)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return  [UIImage imageNamed:card.isChosen ? @"cardfront" : @"back"];
}



@end
