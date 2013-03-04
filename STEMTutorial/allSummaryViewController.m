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
@synthesize type;
@synthesize questionsAsked;
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
if (type==0)
{
    [self loadTestSummary];
    
}else{
    [self loadTestSummary];
    
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
    type=nil;
    [super viewDidUnload];
}

-(void)loadQuizSummary
{
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

-(void)loadTestSummary

{
    
    NSString *questions =[NSString stringWithFormat: @"You managed to answer %d out of %d questions correctly in 3 minutes. This will now be added to your totals.",questionCorrect,questionsAsked];
    summaryLabel.text = questions;
    
    
    
}

- (IBAction)retryButton:(id)sender {
  
    if (topic==0)
    {
    [self performSegueWithIdentifier:@"retryToAlgebra" sender:self];
    }else if (topic ==1)
    {
        [self performSegueWithIdentifier:@"retryTrig" sender:self];
        
    }else if(topic==2){
        [self performSegueWithIdentifier:@"retryVol" sender:self];
    }else{
        [self performSegueWithIdentifier:@"retryGraph" sender:self];
    }
    
}

- (IBAction)menuButton:(id)sender {
}




@end
