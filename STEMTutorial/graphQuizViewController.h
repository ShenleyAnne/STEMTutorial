//
//  graphQuizViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 01/03/2013.
//
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "TUTSimpleScatterPlot.h"

@interface graphQuizViewController : UIViewController
{
    CGPoint lastPoint;
    BOOL mouseSwiped;
    TUTSimpleScatterPlot *_scatterPlot;
    NSMutableArray *xCord;
    NSMutableArray *YCord;
    NSMutableArray *data;
    
}

@property (strong, nonatomic) IBOutlet CPTGraphHostingView *_graphHostingView;

@property (strong, nonatomic) IBOutlet UIImageView *drawingCanvas;
@property (nonatomic, retain) TUTSimpleScatterPlot *scatterPlot;
@property (strong, nonatomic) IBOutlet UILabel *questionText;
- (IBAction)submitButton:(id)sender;

- (IBAction)nextButton:(id)sender;
- (IBAction)clearButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *clearButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *nextButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *submitButtonOutlet;
@property (strong, nonatomic) IBOutlet UILabel *questionNumberText;
@property (strong, nonatomic) IBOutlet UILabel *questionsCorrectText;

@end
