//
//  AlgebraSummaryViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 14/12/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AlgebraSummaryViewController.h"

@implementation AlgebraSummaryViewController

@synthesize questionCorrect;
@synthesize topic;
@synthesize summaryLabel;
@synthesize correctLabel;

- (void)viewDidUnload {
    [self setCorrectLabel:nil];
    [self setSummaryLabel:nil];
    [super viewDidUnload];
}

-(void)viewDidLoad{

    NSString *qscorrect = [NSString stringWithFormat:@"%d/15", questionCorrect];
    NSString *questions = @"You got ";
    NSString *correctCountText = [questions stringByAppendingFormat:(qscorrect)];
    NSString *lowScore = @"You look you are struggling with this topic. Why don't you try going over the tutorial again?";
    NSString *medScore = @"You look you are understanding the concepts but keep practising!";
    NSString *highScore = @"Great work! You have done really well. Why not try another topic now";
    correctLabel.text=correctCountText;
    if (questionCorrect<5){
        summaryLabel.text=lowScore;
    }else if((questionCorrect<10)&&(questionCorrect>=6)){
        summaryLabel.text=medScore;
    }else{
        summaryLabel.text = highScore;
    }
}

- (IBAction)retryButton:(id)sender {
}

- (IBAction)menuButton:(id)sender {
}
@end
