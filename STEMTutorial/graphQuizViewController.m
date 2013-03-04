//
//  graphQuizViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 01/03/2013.
//
//

#import "graphQuizViewController.h"
#import "graphDifficulties.h"
#import "allSummaryViewController.h"

@interface graphQuizViewController ()

@end

@implementation graphQuizViewController

@synthesize drawingCanvas;
//@synthesize graphImage;
@synthesize _graphHostingView;
@synthesize scatterPlot =_scatterPlot;
@synthesize questionText;
@synthesize questionNumberText;
@synthesize questionsCorrectText;


int gCorrect;
int gQuestionCount;
int val1;
int val2;
int sym;
int dType;

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
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    xCord = [NSMutableArray arrayWithCapacity:1000];
    YCord = [NSMutableArray arrayWithCapacity:1000];
 
    self.nextButtonOutlet.userInteractionEnabled=NO;
    self.submitButtonOutlet.userInteractionEnabled=YES;
    self.clearButtonOutlet.userInteractionEnabled=YES;
    
    [self callQuestion];
    
    NSString *qnumstring = [NSString stringWithFormat:@"%d", gQuestionCount];
    NSString *qscorrect = [NSString stringWithFormat:@"%d/15", gCorrect];
    NSString *question = @"Question: ";
    NSString *correctString = @"Correct ";
    NSString *correctCountText = [correctString stringByAppendingFormat:(qscorrect)];
    NSString *textQuestionNumber = [question stringByAppendingString:(qnumstring)];
    [questionNumberText setText:(textQuestionNumber)];
    [questionsCorrectText setText:(correctCountText)];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
 
}

-(void)callQuestion
{
    
    int type =arc4random()%2;
    graphDifficulties *question = [[graphDifficulties alloc]init];
    if (type==0)
   {
        [questionText setText:([question createQD1])];
        dType=1;
        val1 = [question getValue1];
        val2 = [question getValue2];
        sym = [question getSymbol];
        
    }else{
        [questionText setText:([question createQD2])];
        dType=2;
        val1 = [question getValue1];
        val2 = [question getValue2];
        sym = [question getSymbol];
   }
    
}

-(float)convertX:(float)X
{
    if (dType==1)
    {
    if (sym==0)
    {
        float y=(X*val1)+val2;
        return y;
    }else{
        float y=(X*val1)-val2;
        return y;
    }
    }else
    {
        if (sym==0)
        {
            float y=pow(X,val1)+val2;
            return y;
        }else{
            float y=pow(X,val2)-val2;
            return y;
        }

    }
    
}
-(float)convertY:(float)y
{
    if (dType==1)
    {
    if (sym==0)
    {
        float x=(y-val2)/val1;
        return x;
    }else{
        float x=(y+val2)/val1;
        return x;
    }
    }else{
        if (sym==0)
        {
            float x=pow((y-val2),1/val1);
            return x;
        }
        else
        {
            float x=pow((y+val2),1/val1);
            return x;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    
    
    data = [NSMutableArray array];
    
    self.scatterPlot = [[TUTSimpleScatterPlot alloc] initWithHostingView:_graphHostingView andData:data];
    [self.scatterPlot initialisePlot];
    
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self set_graphHostingView:nil];
    [self setDrawingCanvas:nil];
    [self setQuestionText:nil];
    [self setClearButtonOutlet:nil];
    [self setNextButtonOutlet:nil];
    [self setSubmitButtonOutlet:nil];
    [self setQuestionNumberText:nil];
    [self setQuestionsCorrectText:nil];
    [super viewDidUnload];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [xCord removeAllObjects];
    [YCord removeAllObjects];
    //self.drawingCanvas.image = nil;
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
    id plotSpace =  [[[_scatterPlot graph] allPlotSpaces] objectAtIndex:0];
    CGPoint point = [touch locationInView:_graphHostingView];
    point.y = _graphHostingView.bounds.size.height - point.y;
    NSLog(@"Raw Point : %.1f, %.1f", point.x, point.y);
    CPTScatterPlot *scatterPlot = [[[plotSpace graph] allPlots] objectAtIndex:0];
    CGPoint plotAreaPoint = [[plotSpace graph] convertPoint:point toLayer:scatterPlot];
    NSLog(@"PlotAreaPoint : %.1f, %.1f", plotAreaPoint.x, plotAreaPoint.y);
    NSDecimal dataPoint[2];
    NSDecimalNumber *xCoordinate, *yCoordinate;
    [plotSpace plotPoint:dataPoint forPlotAreaViewPoint:plotAreaPoint];
    xCoordinate = [NSDecimalNumber decimalNumberWithDecimal:dataPoint[0]];
    yCoordinate = [NSDecimalNumber decimalNumberWithDecimal:dataPoint[1]];
    NSLog(@"DataPoint : %.1f, %.1f", [xCoordinate floatValue], [yCoordinate floatValue]);
    [xCord addObject:(xCoordinate)];
    [YCord addObject:(yCoordinate)];
    
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.drawingCanvas.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 2.0 );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0, 255, 0, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.drawingCanvas.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.drawingCanvas setAlpha:1.0];
    UIGraphicsEndImageContext();
    lastPoint = currentPoint;
    id plotSpace =  [[[_scatterPlot graph] allPlotSpaces] objectAtIndex:0];
    CGPoint point = [touch locationInView:_graphHostingView];
    point.y = _graphHostingView.bounds.size.height - point.y;
    NSLog(@"Raw Point : %.1f, %.1f", point.x, point.y);
    CPTScatterPlot *scatterPlot = [[[plotSpace graph] allPlots] objectAtIndex:0];
    CGPoint plotAreaPoint = [[plotSpace graph] convertPoint:point toLayer:scatterPlot];
    NSLog(@"PlotAreaPoint : %.1f, %.1f", plotAreaPoint.x, plotAreaPoint.y);
    NSDecimal dataPoint[2];
    NSDecimalNumber *xCoordinate, *yCoordinate;
    [plotSpace plotPoint:dataPoint forPlotAreaViewPoint:plotAreaPoint];
    xCoordinate = [NSDecimalNumber decimalNumberWithDecimal:dataPoint[0]];
    yCoordinate = [NSDecimalNumber decimalNumberWithDecimal:dataPoint[1]];
    NSLog(@"DataPoint : %.1f, %.1f", [xCoordinate floatValue], [yCoordinate floatValue]);
    [xCord addObject:(xCoordinate)];
    [YCord addObject:(yCoordinate)];
    
    
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.drawingCanvas.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 2.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0, 255, 0, 1.0);
        self.drawingCanvas.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    id plotSpace =  [[[_scatterPlot graph] allPlotSpaces] objectAtIndex:0];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:_graphHostingView];
    point.y = _graphHostingView.bounds.size.height - point.y;
    NSLog(@"Raw Point : %.1f, %.1f", point.x, point.y);
    CPTScatterPlot *scatterPlot = [[[plotSpace graph] allPlots] objectAtIndex:0];
    CGPoint plotAreaPoint = [[plotSpace graph] convertPoint:point toLayer:scatterPlot];
    NSLog(@"PlotAreaPoint : %.1f, %.1f", plotAreaPoint.x, plotAreaPoint.y);
    NSDecimal dataPoint[2];
    NSDecimalNumber *xCoordinate, *yCoordinate;
    [plotSpace plotPoint:dataPoint forPlotAreaViewPoint:plotAreaPoint];
    xCoordinate = [NSDecimalNumber decimalNumberWithDecimal:dataPoint[0]];
    yCoordinate = [NSDecimalNumber decimalNumberWithDecimal:dataPoint[1]];
    NSLog(@"DataPoint : %.1f, %.1f", [xCoordinate floatValue], [yCoordinate floatValue]);
    [xCord addObject:(xCoordinate)];
    [YCord addObject:(yCoordinate)];
    
    
    
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
    gCorrect++;
}


-(int)errorCheck
{
    
    float yTop;
    float yMiddlePos;
    float yBottom;
    float yMiddleNeg;
    float y0;
    float x0;
    int checkcount = 0;
    /*
    Boolean check1 = false;
    Boolean check2 = false;
    Boolean check3 = false;
    Boolean check4 = false;
    Boolean check5 = false;
    Boolean check6 = false;
     */
    yTop = [self convertY:(20)];
    yMiddlePos=[self convertY:(10)];
    yBottom = [self convertY:(-20)];
    yMiddleNeg = [self convertY:(-10)];
    float lowerbound;
    float upperbound;
    float curxcord;
    float curycord;
    y0=[self convertY:(0)];
    x0=[self convertX:(0)];
    int count = xCord.count;
    lowerbound = yTop -0.50;
    upperbound = yTop +0.50;
    for (int i=0;i<count;i++)
    {
        curxcord = [[xCord objectAtIndex:(i)]floatValue];
        if ((curxcord>=lowerbound)&&(curxcord<=upperbound))
        {
            lowerbound = 20-1;
            upperbound=20+1;
            curycord = [[YCord objectAtIndex:(i)]floatValue];
            if ((curycord>=lowerbound)&&(curycord<=upperbound))
            {
               // check1 = true;
                NSLog(@"CHECK 1 OK");
                checkcount++;
                break;
            }
        }
    }
    lowerbound = yMiddlePos -1;
    upperbound = yMiddlePos +1;
    for (int i=0;i<count;i++)
    {
        curxcord = [[xCord objectAtIndex:(i)]floatValue];
        if ((curxcord>=lowerbound)&&(curxcord<=upperbound))
        {
            lowerbound = 10-1;
            upperbound=10+1;
            curycord = [[YCord objectAtIndex:(i)]floatValue];
            if ((curycord>=lowerbound)&&(curycord<=upperbound))
            {
                //check2 = true;
                NSLog(@"CHECK 2 OK");
                checkcount++;
                break;
                
            }
        }
    }
    lowerbound = yBottom -1;
    upperbound = yBottom +1;
    for (int i=0;i<count;i++)
    {
        curxcord = [[xCord objectAtIndex:(i)]floatValue];
        if ((curxcord>=lowerbound)&&(curxcord<=upperbound))
        {
            lowerbound = -20-1;
            upperbound=-20+1;
            curycord = [[YCord objectAtIndex:(i)]floatValue];
            if ((curycord>=lowerbound)&&(curycord<=upperbound))
            {
                //check3 = true;
                NSLog(@"CHECK 3 OK");
                checkcount++;
                break;
                ;
            }
        }
    }
    lowerbound = yMiddleNeg -1;
    upperbound = yMiddleNeg +1;
    for (int i=0;i<count;i++)
    {
        curxcord = [[xCord objectAtIndex:(i)]floatValue];
        if ((curxcord>=lowerbound)&&(curxcord<=upperbound))
        {
            lowerbound = -10-1;
            upperbound=-10+1;
            curycord = [[YCord objectAtIndex:(i)]floatValue];
            if ((curycord>=lowerbound)&&(curycord<=upperbound))
            {
               // check4 = true;
                NSLog(@"CHECK 4 OK");
                checkcount++;
                break;
                
            }
        }
    }
    lowerbound = y0 -1;
    upperbound = y0 +1;
    for (int i=0;i<count;i++)
    {
        curxcord = [[xCord objectAtIndex:(i)]floatValue];
        if ((curxcord>=lowerbound)&&(curxcord<=upperbound))
        {
            lowerbound = 0-1;
            upperbound=0+1;
            curycord = [[YCord objectAtIndex:(i)]floatValue];
            if ((curycord>=lowerbound)&&(curycord<=upperbound))
            {
                //check5 = true;
                NSLog(@"CHECK 5 OK");
                checkcount++;
                break;
                
            }
        }
    }
    lowerbound = x0 -1;
    upperbound = x0 +1;
    for (int i=0;i<count;i++)
    {
        curycord = [[YCord objectAtIndex:(i)]floatValue];
        if ((curycord>=lowerbound)&&(curxcord<=upperbound))
        {
            lowerbound = 0-1;
            upperbound=0+1;
            curxcord = [[YCord objectAtIndex:(i)]floatValue];
            if ((curxcord>=lowerbound)&&(curycord<=upperbound))
            {
               // check6 = true;
                NSLog(@"CHECK 6 OK");
                checkcount++;
                break;
                
            }
        }
    }
    NSLog(@"checks ok %d",checkcount);
    return checkcount;
}

- (IBAction)clearButton:(id)sender {
    self.drawingCanvas.image = nil;
}

- (IBAction)nextButton:(id)sender {
    
    [xCord removeAllObjects];
    [YCord removeAllObjects];
    [data removeAllObjects];
    gQuestionCount++;
    self.drawingCanvas.image = nil;
    [self.scatterPlot initialisePlot];
    if (gQuestionCount < 16)
    {
        
        [self viewDidLoad];
    }else{
        
        [self performSegueWithIdentifier:@"segueToSummary" sender:self];
        gQuestionCount=1;
        gCorrect=0;
    }
}


- (IBAction)submitButton:(id)sender {
    
    for (float i = 10; i > 0; i=i-0.5)
    {
        [data addObject:[NSValue valueWithCGPoint:CGPointMake(i*-1, [self convertX:(i*-1)])]];
        NSLog(@"output %.1f and %.1f", i*-1, [self convertX:(i*-1)]);
    }
    
    for (float i = 0; i <= 10; i=i+0.5)
    {
        [data addObject:[NSValue valueWithCGPoint:CGPointMake(i, [self convertX:i])]];
        
        
        
    }
    
    [self.scatterPlot initialisePlot];
    int numOfErrors = [self errorCheck];
    if (numOfErrors>4)
    {
        gCorrect++;
        [self loadrightbox];
    }else{
        [self loadwrongbox];
    }
    self.nextButtonOutlet.userInteractionEnabled=YES;
    self.clearButtonOutlet.userInteractionEnabled=NO;
    self.submitButtonOutlet.userInteractionEnabled=NO;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueToSummary"]){
        
        allSummaryViewController *controller = [segue destinationViewController];
        controller.questionCorrect = gCorrect;
        controller.topic = 3; //algebra topic
    }
    
}


@end
