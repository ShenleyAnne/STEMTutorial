//
//  volAreaSummaryViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 17/01/2013.
//
//

#import "volAreaSummaryViewController.h"

@interface volAreaSummaryViewController ()

@end

@implementation volAreaSummaryViewController

@synthesize questionCorrect;
@synthesize summaryLabel;
@synthesize correctLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
        summaryLabel.text=lowScore;
    }else if((questionCorrect<10)&&(questionCorrect>=6)){
        summaryLabel.text=medScore;
    }else{
        summaryLabel.text = highScore;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setSummaryLabel:nil];
    [self setCorrectLabel:nil];
    [super viewDidUnload];
}
- (IBAction)retryButton:(id)sender {
}

- (IBAction)menuButton:(id)sender {
}
@end
