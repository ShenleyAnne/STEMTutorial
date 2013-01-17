//
//  trigSummaryViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 16/01/2013.
//
//

#import "trigSummaryViewController.h"


@implementation trigSummaryViewController

@synthesize summaryLabel;
@synthesize correctLabel;
@synthesize questionCorrect;

- (void)viewDidUnload {
    [self setSummaryLabel:nil];
    [self setCorrectLabel:nil];
    [super viewDidUnload];
}

- (void)viewDidLoad
{
    NSString *qscorrect = [NSString stringWithFormat:@"%d/15", questionCorrect];
    NSString *questions = @"You got ";
    NSString *correctCountText = [questions stringByAppendingFormat:(qscorrect)];
    NSString *lowScore = @"You look you are struggling with this topic. Why don't you try going over the tutorial again?";
    NSString *medScore = @"You look you are understanding the concepts but keep practising!";
    NSString *highScore = @"Great work! You have done really well. Why not try another topic now";
    correctLabel.text=correctCountText;
    if (questionCorrect<5){
        summaryLabel.text=correctCountText;
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
