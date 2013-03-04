//
//  algebraQuizViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "algebraQuizViewController.h"
#import "AlgebraDifficulties.h"
#import "allSummaryViewController.h"
#include <stdlib.h>

@implementation algebraQuizViewController
@synthesize questionNumber;
@synthesize coorectAnswers;
@synthesize answerAbuttontext;
@synthesize answerbbuttontext;
@synthesize answercbuttontext;
@synthesize answerdbuttontext;
@synthesize questionTextfield;

int correctanswer = 0; //correct answer defined here, set in each method
int questionCount = 1;
int correct = 0;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidUnload
{
   
   
    [self setQuestionTextfield:nil];
    [self setAnswerAbuttontext:nil];
    [self setAnswerbbuttontext:nil];
    [self setAnswercbuttontext:nil];
    [self setAnswerdbuttontext:nil];
    [self setCoorectAnswers:nil];
    [self setQuestionNumber:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
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
    correct++;
}

-(void)changeButtonAnswers
{
    int j = correctanswer+20;
    int i = arc4random()%4;
    int otherans1 = arc4random() %j;
    int otherans2 = arc4random() %j;
    int otherans3 = arc4random() %j;
    NSString *otheran1 = [NSString stringWithFormat:@"%d", otherans1];
    NSString *otheran2 = [NSString stringWithFormat:@"%d", otherans2];
    NSString *otheran3 = [NSString stringWithFormat:@"%d", otherans3];
    NSString *answer = [NSString stringWithFormat:@"%d", correctanswer];
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
    
    questionCount++;
    
    if (questionCount < 16)
    {
        
    [self viewDidLoad];
    }else{
        
        [self performSegueWithIdentifier:@"segueToSummary" sender:self];
        questionCount=1;
        correct = 0;
    }
    
    
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
    [questionTextfield setText:(textQuestion)];
    correctanswer = [question answer];
    
}


-(void)viewDidLoad
{
  
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    NSString *qnumstring = [NSString stringWithFormat:@"%d", questionCount];
    NSString *qscorrect = [NSString stringWithFormat:@"%d/15", correct];
    NSString *question = @"Question: ";
    NSString *correctString = @"Correct ";
    NSString *correctCountText = [correctString stringByAppendingFormat:(qscorrect)];
    NSString *textQuestionNumber = [question stringByAppendingString:(qnumstring)];
    [questionNumber setText:(textQuestionNumber)];
    [coorectAnswers setText:(correctCountText)];
    [self refactoredCallQuestion];
    [self changeButtonAnswers];
    }


-(IBAction)answerAButton:(id)sender {
    int buttonValue = answerAbuttontext.currentTitle.intValue;
    if (buttonValue==correctanswer)
    {
        [self loadrightbox];
        
    }else{
        [self loadwrongbox];
    }    
}


- (IBAction)answerBbutton:(id)sender {
    int buttonValue = answerbbuttontext.currentTitle.intValue;
    if (buttonValue==correctanswer)
    {
        [self loadrightbox];
    }else{
       [self loadwrongbox];
    }
}

- (IBAction)answerCbutton:(id)sender {
    int buttonValue = answercbuttontext.currentTitle.intValue;
    if (buttonValue==correctanswer)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerDbutton:(id)sender {
    int buttonValue = answerdbuttontext.currentTitle.intValue;
    if (buttonValue==correctanswer)
    {
       [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueToSummary"]){
    
        allSummaryViewController *controller = [segue destinationViewController];
        controller.questionCorrect = correct;
        controller.topic = 0; //algebra topic
    }

}

- (IBAction)quitButton:(id)sender {
}
@end
