//
//  volAreaQuizViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 14/12/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "volAreaQuizViewController.h"

@implementation volAreaQuizViewController
@synthesize correctAnswer;
@synthesize questionNumber;
@synthesize questionTextfield;
@synthesize answerAbuttontext;
@synthesize answerbbuttontext;
@synthesize answercbuttontext;
@synthesize answerdbuttontext;

int VAcorrectanswer = 0; //correct answer defined here, set in each method
int VAquestionCount = 1; //what question number user is on
int VAcorrect = 0; //how many question user has gotten correct

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setCorrectAnswer:nil];
    [self setQuestionNumber:nil];
    [self setQuestionTextfield:nil];
    [self setAnswerAbuttontext:nil];
    [self setAnswerbbuttontext:nil];
    [self setAnswercbuttontext:nil];
    [self setAnswerdbuttontext:nil];
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
    //displays a ui alert view informing the user has gotten the question wrong
    UIAlertView *wrongbox = [[UIAlertView alloc]initWithTitle:(@"Wrong") message:(@"Wrong answer :(") delegate:self cancelButtonTitle:(@"Ok") otherButtonTitles:nil, nil];
    [wrongbox show];
    
}

-(void)loadrightbox
{
    //displays a ui alert view informing the user has gotten the question right
    UIAlertView *correctbox = [[UIAlertView alloc]initWithTitle:(@"Correct") message:(@"Correct answer!") delegate:self cancelButtonTitle:(@"ok") otherButtonTitles:nil, nil];
    [correctbox show];
    VAcorrect++;
}

-(void)changeButtonAnswers
{
    //retrieves the correct answer for the current question, sets one of the buttons to this answer and changes the other 3 buttons to random answer. Button where correct answer is stored is based on a random number.
    int j = VAcorrectanswer+20;
    int i = (arc4random()%4)+1;
    int otherans1 = arc4random() %j;
    int otherans2 = arc4random() %j;
    int otherans3 = arc4random() %j;
    NSString *otheran1 = [NSString stringWithFormat:@"%d", otherans1];
    NSString *otheran2 = [NSString stringWithFormat:@"%d", otherans2];
    NSString *otheran3 = [NSString stringWithFormat:@"%d", otherans3];
    NSString *answer = [NSString stringWithFormat:@"%d", VAcorrectanswer];
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
    //when the user dismisses the ui alert view it checks how many questions the user has answered and either calls another question and opens the summary ui view controller.
    VAquestionCount++;
    
    if (VAquestionCount < 16)
    {
        
        [self viewDidLoad];
    }else{
        VAcorrect = 0;
        VAquestionCount = 1;
        [self performSegueWithIdentifier:@"segueToSummary" sender:self];
    }
    
    
}

- (IBAction)answerAButton:(id)sender {
    
    int buttonValue = answerAbuttontext.currentTitle.intValue;
    if (buttonValue==VAcorrectanswer)
    {
        [self loadrightbox];
        
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerBbutton:(id)sender {
    
    int buttonValue = answerbbuttontext.currentTitle.intValue;
    if (buttonValue==VAcorrectanswer)
    {
        [self loadrightbox];
        
    }else{
        [self loadwrongbox];
    }
}



- (IBAction)answerCbutton:(id)sender {
    
    int buttonValue = answercbuttontext.currentTitle.intValue;
    if (buttonValue==VAcorrectanswer)
    {
        [self loadrightbox];
        
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerDbutton:(id)sender {
    
    int buttonValue = answerdbuttontext.currentTitle.intValue;
    if (buttonValue== VAcorrectanswer)
    {
        [self loadrightbox];
        
    }else{
        [self loadwrongbox];
    }
}
@end
