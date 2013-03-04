//
//  VolAreaTestViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 04/03/2013.
//
//

#import "VolAreaTestViewController.h"
#import "volAreaDifficulties.h"
#import "allSummaryViewController.h"

@interface VolAreaTestViewController ()
{
    
    NSTimer *timer;
    int curMinute;
    int curSecond;
}

@end

@implementation VolAreaTestViewController
@synthesize answerAbuttontext;
@synthesize answerbbuttontext;
@synthesize answercbuttontext;
@synthesize answerdbuttontext;
@synthesize questionTextField;
@synthesize correctLabel;
@synthesize timerLabel;
@synthesize correctAnswers;

int correctAnswerVATest=0;
int questionsCountVATest=1;
int correctVATest=0;

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
    NSString *qscorrect = [NSString stringWithFormat:@"%d/%d", correctVATest,questionsCountVATest];
    NSString *correctString = @"Correct ";
    NSString *correctCountText = [correctString stringByAppendingFormat:(qscorrect)];
    [correctLabel setText:(correctCountText)];
    [timerLabel setText:@"Time: 3:00"];
    [timerLabel setTextColor:[UIColor redColor]];
    curMinute=2;
    curSecond=60;
    [self callRefactoredDifficulty];
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

-(void)newQuestion
{
    [self callRefactoredDifficulty];
    [self changeButtonAnswers];
    NSString *qscorrect = [NSString stringWithFormat:@"%d/%d", correctVATest,questionsCountVATest];
    NSString *correctString = @"Correct ";
    NSString *correctCountText = [correctString stringByAppendingFormat:(qscorrect)];
    [correctLabel setText:(correctCountText)];
    
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    questionsCountVATest++;
    [self newQuestion];
    
}

-(void)callRefactoredDifficulty
{
    int type = arc4random()%2;
    volAreaDifficulties *question = [[volAreaDifficulties alloc]init];
    if (type==0)
    {
        [questionTextField setText:([question createQD1])];
    }else{
        [questionTextField setText:([question createQD2])];
    }
    correctAnswerVATest = [question answer];
    
    
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
        questionsCountVATest=1;
        correctVATest = 0;
        
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
    correctVATest++;
}


    
- (IBAction)answerAButton:(id)sender {
    int buttonValue = answerAbuttontext.currentTitle.intValue;
    if (buttonValue==correctAnswerVATest)
    {
        [self loadrightbox];
        
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerBbutton:(id)sender {
    int buttonValue = answerbbuttontext.currentTitle.intValue;
    if (buttonValue==correctAnswerVATest)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}
- (IBAction)answerCButton:(id)sender {
    
    int buttonValue = answercbuttontext.currentTitle.intValue;
    if (buttonValue==correctAnswerVATest)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerDbutton:(id)sender {
    int buttonValue = answerdbuttontext.currentTitle.intValue;
    if (buttonValue==correctAnswerVATest)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

-(void)changeButtonAnswers
{
    //retrieves the correct answer for the current question, sets one of the buttons to this answer and changes the other 3 buttons to random answer. Button where correct answer is stored is based on a random number.
    int j = correctAnswerVATest+20;
    int i = (arc4random()%4)+1;
    int otherans1 = (arc4random() %j)+1;
    int otherans2 = (arc4random() %j)+1;
    int otherans3 = (arc4random() %j)+1;
    NSString *otheran1 = [NSString stringWithFormat:@"%d", otherans1];
    NSString *otheran2 = [NSString stringWithFormat:@"%d", otherans2];
    NSString *otheran3 = [NSString stringWithFormat:@"%d", otherans3];
    NSString *answer = [NSString stringWithFormat:@"%d", correctAnswerVATest];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueToSummary"]){
        
        allSummaryViewController *controller = [segue destinationViewController];
        controller.questionCorrect = correctVATest;
        controller.questionsAsked = questionsCountVATest;
        controller.topic = 2; //volArea topic
        controller.type =0; //test
    }
}

- (IBAction)quidButton:(id)sender {
}
@end
