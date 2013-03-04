//
//  algebraTestViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 04/03/2013.
//
//

#import "algebraTestViewController.h"
#import "AlgebraDifficulties.h"
#import "allSummaryViewController.h"
#import <Foundation/Foundation.h>


@interface algebraTestViewController ()
{
    
    NSTimer *timer;
    int curMinute;
    int curSecond;
}

@end

@implementation algebraTestViewController
@synthesize answerAbuttontext;
@synthesize answerbbuttontext;
@synthesize answercbuttontext;
@synthesize answerdbuttontext;
@synthesize questionTextField;
@synthesize timerLabel;
@synthesize correctLabel;


int correctanswerTest = 0; //correct answer defined here, set in each method
int questionCountTest = 1;
int correctTest = 0;


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
    
     NSString *qscorrect = [NSString stringWithFormat:@"%d/%d", correctTest,questionCountTest];
     NSString *correctString = @"Correct ";
     NSString *correctCountText = [correctString stringByAppendingFormat:(qscorrect)];
    [correctLabel setText:(correctCountText)];
    [timerLabel setText:@"Time: 3:00"];
    [timerLabel setTextColor:[UIColor redColor]];
    curMinute=2;
    curSecond=60;
     [self refactoredCallQuestion];
     [self changeButtonAnswers];
    [self start];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTimerLabel:nil];
    [self setCorrectLabel:nil];
    [self setQuestionTextField:nil];
    [self setAnswerAbuttontext:nil];
    [self setAnswerbbuttontext:nil];
    [self setAnswercbuttontext:nil];
    [self setAnswerdbuttontext:nil];
    [super viewDidUnload];
}

-(void)start
{
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}
-(void)timerFired
{
    if((curMinute>0 || curSecond>=0) && curMinute>=0)
    {
        if(curSecond==0)
        {
            curMinute-=1;
            curSecond=60;
        }
        else if(curSecond>0)
        {
            curSecond-=1;
        }
        if(curMinute>-1)
            [timerLabel setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",curMinute,@":",curSecond]];
    }
    else
    {
        [timer invalidate];
        [self performSegueWithIdentifier:@"segueToSummary" sender:self];
        questionCountTest=1;
        correctTest = 0;
        
    }
}
-(IBAction)answerAButton:(id)sender {
    int buttonValue = answerAbuttontext.currentTitle.intValue;
    if (buttonValue==correctanswerTest)
    {
        [self loadrightbox];
        
    }else{
        [self loadwrongbox];
    }
}


- (IBAction)answerBbutton:(id)sender {
    int buttonValue = answerbbuttontext.currentTitle.intValue;
    if (buttonValue==correctanswerTest)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerCbutton:(id)sender {
    int buttonValue = answercbuttontext.currentTitle.intValue;
    if (buttonValue==correctanswerTest)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerDbutton:(id)sender {
    int buttonValue = answerdbuttontext.currentTitle.intValue;
    if (buttonValue==correctanswerTest)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

-(void)loadwrongbox
{
    UIAlertView *wrongbox = [[UIAlertView alloc]initWithTitle:(@"Wrong") message:(@"Wrong answer :(") delegate:self cancelButtonTitle:(@"Ok") otherButtonTitles:nil, nil];
    [wrongbox show];
    
}

-(void)loadrightbox
{
    UIAlertView *correctbox = [[UIAlertView alloc]initWithTitle:(@"Correct") message:(@"Correct answer!") delegate:self cancelButtonTitle:(@"ok") otherButtonTitles:nil, nil];
    [correctbox show];
    correctTest++;
}

-(void)changeButtonAnswers
{
    int j = correctanswerTest+20;
    int i = arc4random()%4;
    int otherans1 = arc4random() %j;
    int otherans2 = arc4random() %j;
    int otherans3 = arc4random() %j;
    NSString *otheran1 = [NSString stringWithFormat:@"%d", otherans1];
    NSString *otheran2 = [NSString stringWithFormat:@"%d", otherans2];
    NSString *otheran3 = [NSString stringWithFormat:@"%d", otherans3];
    NSString *answer = [NSString stringWithFormat:@"%d", correctanswerTest];
    if (i==1)
    {
        
        [answerAbuttontext setTitle:(answer) forState:(UIControlStateNormal)];
        [answerbbuttontext setTitle:(otheran1) forState:(UIControlStateNormal)];
        [answercbuttontext setTitle:(otheran2) forState:(UIControlStateNormal)];
        [answerdbuttontext setTitle:(otheran3) forState:(UIControlStateNormal)];
        
        
    }else if (i==2){
        
        [answerbbuttontext setTitle:(answer) forState:(UIControlStateNormal)];
        [answerAbuttontext setTitle:(otheran1) forState:(UIControlStateNormal)];
        [answercbuttontext setTitle:(otheran2) forState:(UIControlStateNormal)];
        [answerdbuttontext setTitle:(otheran3) forState:(UIControlStateNormal)];
        
    }else if (i==3){
        [answercbuttontext setTitle:(answer) forState:(UIControlStateNormal)];
        [answerbbuttontext setTitle:(otheran1) forState:(UIControlStateNormal)];
        [answerAbuttontext setTitle:(otheran2) forState:(UIControlStateNormal)];
        [answerdbuttontext setTitle:(otheran3) forState:(UIControlStateNormal)];
        
    }else if (i==4){
        [answerdbuttontext setTitle:(answer) forState:(UIControlStateNormal)];
        [answerbbuttontext setTitle:(otheran1) forState:(UIControlStateNormal)];
        [answercbuttontext setTitle:(otheran2) forState:(UIControlStateNormal)];
        [answerAbuttontext setTitle:(otheran3) forState:(UIControlStateNormal)];
        
    }else{
        [answerAbuttontext setTitle:(answer) forState:(UIControlStateNormal)];
        [answerbbuttontext setTitle:(otheran1) forState:(UIControlStateNormal)];
        [answercbuttontext setTitle:(otheran2) forState:(UIControlStateNormal)];
        [answerdbuttontext setTitle:(otheran3) forState:(UIControlStateNormal)];
    }
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    questionCountTest++;
    [self newQuestion];
    
  
    
    
}

-(void)newQuestion
{
    [self refactoredCallQuestion];
    [self changeButtonAnswers];
    NSString *qscorrect = [NSString stringWithFormat:@"%d/%d", correctTest,questionCountTest];
    NSString *correctString = @"Correct ";
    NSString *correctCountText = [correctString stringByAppendingFormat:(qscorrect)];
    [correctLabel setText:(correctCountText)];
    
}

-(void)refactoredCallQuestion
{
    
    int qtype = arc4random()%3;
    AlgebraDifficulties *question = [[AlgebraDifficulties alloc]init];
    NSString *equation;
    if (qtype==0)
    {
        equation = [question createQD1];
    }else if(qtype==1)
    {
        equation=[question createQD2];
    }else{
        equation= [question createQD3];
    }
    
    NSString *q = @"Solve Y for the equation: ";
    NSString *textQuestion = [q stringByAppendingString:(equation)];
    [questionTextField setText:(textQuestion)];
    correctanswerTest = [question answer];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueToSummary"]){
        
        allSummaryViewController *controller = [segue destinationViewController];
        controller.questionCorrect = correctTest;
        controller.questionsAsked = questionCountTest;
        controller.topic = 0; //algebra topic
        controller.type =0;
    }
    
}

@end
