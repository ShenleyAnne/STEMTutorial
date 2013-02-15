//
//  allSummaryViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 14/02/2013.
//
//

#import "allSummaryViewController.h"
#import "algebraQuizViewController.h"
#import "trigQuizViewController.h"
#import "volAreaQuizViewController.h"

@interface allSummaryViewController ()

@end

@implementation allSummaryViewController

@synthesize questionCorrect;
@synthesize topic;
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
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    NSString *qscorrect = [NSString stringWithFormat:@"%d/15", questionCorrect];
    NSString *questions = @"You got ";
    NSString *correctCountText = [questions stringByAppendingFormat:(qscorrect)];
    NSString *lowScore = @"You look you are struggling with this topic. Why don't you try going over the tutorial again?";
    NSString *medScore = @"You look you are understanding the concepts but keep practising!";
    NSString *highScore = @"Great work! You have done really well. Why not try another topic now";
    correctLabel.text=correctCountText;
    if (questionCorrect<=5){
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
    if (topic==0)
    {
    [self performSegueWithIdentifier:@"retryToAlgebra" sender:self];
    }else if (topic ==1)
    {
        [self performSegueWithIdentifier:@"retryTrig" sender:self];
        
    }else{
        [self performSegueWithIdentifier:@"retryVol" sender:self];
    }
}

- (IBAction)menuButton:(id)sender {
}




@end
