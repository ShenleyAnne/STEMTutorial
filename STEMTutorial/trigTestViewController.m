//
//  trigTestViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 04/03/2013.
//
//

#import "trigTestViewController.h"
#import "allSummaryViewController.h"
#import "trigDifficulties.h"

@interface trigTestViewController ()
{
    NSTimer *timer;
    int curMinute;
    int curSecond;
}

@end

@implementation trigTestViewController
@synthesize questionTextField;
@synthesize answerAbuttontext;
@synthesize answerbbuttontext;
@synthesize answercbuttontext;
@synthesize answerdbuttontext;
@synthesize correctLabel;
@synthesize timerLabel;

int trigCorrectAnswerTest=0;
int trigQuestionCountTest=1;
int trigCorrectTest=0;


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
    trigCorrectTest++;
}

- (void)viewDidLoad
{
    NSString *qscorrect = [NSString stringWithFormat:@"%d/%d", trigCorrectTest,trigQuestionCountTest];
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
        trigQuestionCountTest=1;
        trigCorrectTest = 0;
        
    }
    
}


-(void)changeButtonAnswers
{
    int j = trigCorrectAnswerTest+20;
    int i = arc4random()%4;
    int otherans1 = arc4random() %j;
    int otherans2 = arc4random() %j;
    int otherans3 = arc4random() %j;
    NSString *otheran1 = [NSString stringWithFormat:@"%d", otherans1];
    NSString *otheran2 = [NSString stringWithFormat:@"%d", otherans2];
    NSString *otheran3 = [NSString stringWithFormat:@"%d", otherans3];
    NSString *answer = [NSString stringWithFormat:@"%d", trigCorrectAnswerTest];
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
    
    trigQuestionCountTest++;
    [self newQuestion];

    
    
}

-(void)newQuestion
{
    [self callRefactoredDifficulty];
    [self changeButtonAnswers];
    NSString *qscorrect = [NSString stringWithFormat:@"%d/%d", trigCorrectTest, trigQuestionCountTest];
    NSString *correctString = @"Correct ";
    NSString *correctCountText = [correctString stringByAppendingFormat:(qscorrect)];
    [correctLabel setText:(correctCountText)];
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
    trigCorrectAnswerTest=[question answer];
    
}


- (IBAction)answerAButton:(id)sender {
    float buttonValue = answerAbuttontext.currentTitle.integerValue;
    if (buttonValue==trigCorrectAnswerTest)
    {
        [self loadrightbox];
        
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerBButton:(id)sender {
    
    float buttonValue = answerbbuttontext.currentTitle.integerValue;
    if (buttonValue==trigCorrectAnswerTest)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerCButton:(id)sender {
    
    float buttonValue = answercbuttontext.currentTitle.integerValue;
    if (buttonValue==trigCorrectAnswerTest)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

- (IBAction)answerDButotn:(id)sender {
    
    float buttonValue = answerdbuttontext.currentTitle.integerValue;
    if (buttonValue==trigCorrectAnswerTest)
    {
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueToSummary"]){
        
        allSummaryViewController *controller = [segue destinationViewController];
        controller.questionCorrect = trigCorrectTest;
        controller.questionsAsked = trigQuestionCountTest;
        controller.topic = 1; //trig topic
        controller.type =0; //test
    }
}

- (IBAction)quitButton:(id)sender {
}
@end
