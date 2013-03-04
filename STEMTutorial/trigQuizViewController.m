//
//  trigQuizViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 03/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "trigQuizViewController.h"
#import "allSummaryViewController.h"
#import "trigDifficulties.h"

@implementation trigQuizViewController
@synthesize questionNumber;
@synthesize correctAnswer;
@synthesize questionTextField;
@synthesize answerAbuttontext;
@synthesize answerbbuttontext;
@synthesize answercbuttontext;
@synthesize answerdbuttontext;


int trigcorrectanswer = 0; //correct answer defined here, set in each method
int trigquestionCount = 1; //how many questions answered
int trigcorrect = 0; //how many question answered correctly

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    trigcorrect++;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [self setQuestionNumber:nil];
    [self setCorrectAnswer:nil];
    [self setQuestionTextField:nil];
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


-(void)changeButtonAnswers
{
    int j = trigcorrectanswer+20;
    int i = arc4random()%4;
    int otherans1 = arc4random() %j;
    int otherans2 = arc4random() %j;
    int otherans3 = arc4random() %j;
    NSString *otheran1 = [NSString stringWithFormat:@"%d", otherans1];
    NSString *otheran2 = [NSString stringWithFormat:@"%d", otherans2];
    NSString *otheran3 = [NSString stringWithFormat:@"%d", otherans3];
    NSString *answer = [NSString stringWithFormat:@"%d", trigcorrectanswer];
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
    
    trigquestionCount++;
    
    if (trigquestionCount < 16)
    {
        
        [self viewDidLoad];
    }else{
    
        [self performSegueWithIdentifier:@"segueToSummary" sender:self];
        trigquestionCount=1;
        trigcorrect = 0;
    }
    
    
}


-(void)viewDidLoad
{
   [self.navigationController setNavigationBarHidden:YES animated:YES];

    NSString *qnumstring = [NSString stringWithFormat:@"%d", trigquestionCount];
    NSString *qscorrect = [NSString stringWithFormat:@"%d/15", trigcorrect];
    NSString *question = @"Question: ";
    NSString *correctString = @"Correct ";
    NSString *correctCountText = [correctString stringByAppendingFormat:(qscorrect)];
    NSString *textQuestionNumber = [question stringByAppendingString:(qnumstring)];
    [questionNumber setText:(textQuestionNumber)];
    [correctAnswer setText:(correctCountText)];
    [self callRefactoredDifficulty];
    [self changeButtonAnswers];
    
}

-(void)callRefactoredDifficulty
{
    
    trigDifficulties *question = [[trigDifficulties alloc]init];
    int type = arc4random()%3;
    if (type==0)
    {
        [questionTextField setText:([question createQD1])];
    }else if (type==1){
        [questionTextField setText:([question createQD2])];
        
    }else{
        
        [questionTextField setText:([question createQD3])];
    }
    trigcorrectanswer=[question answer];
    
}


-(IBAction)answerAButton:(id)sender {
    float buttonValue = answerAbuttontext.currentTitle.integerValue;
    if (buttonValue==trigcorrectanswer)
    {
        [self loadrightbox];
        
    }else{
        [self loadwrongbox];
    }    
}


- (IBAction)answerBButton2:(id)sender {
    float buttonValue = answerbbuttontext.currentTitle.integerValue;
    if (buttonValue==trigcorrectanswer)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)quitButton:(id)sender {
}

- (IBAction)answerCbutton:(id)sender {
    float buttonValue = answercbuttontext.currentTitle.integerValue;
    if (buttonValue==trigcorrectanswer)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerDbutton:(id)sender {
    float buttonValue = answerdbuttontext.currentTitle.integerValue;
    if (buttonValue==trigcorrectanswer)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueToSummary"]){
       
        allSummaryViewController *controller = [segue destinationViewController];
        controller.questionCorrect =trigcorrect;
        controller.topic = 1;
        controller.type=1;
    }
}


@end
