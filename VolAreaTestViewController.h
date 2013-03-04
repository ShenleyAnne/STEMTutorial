//
//  VolAreaTestViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 04/03/2013.
//
//

#import <UIKit/UIKit.h>

@interface VolAreaTestViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *correctLabel;
@property (strong, nonatomic) IBOutlet UITextView *questionTextField;
@property (strong, nonatomic) IBOutlet UIButton *answerAbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerbbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answercbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerdbuttontext;
- (IBAction)answerAButton:(id)sender;
- (IBAction)answerBbutton:(id)sender;
- (IBAction)answerCButton:(id)sender;
- (IBAction)answerDbutton:(id)sender;
- (IBAction)quidButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *correctAnswers; //label to display how many question user has got right
@property (strong, nonatomic) IBOutlet UILabel *questionsAsked;
@end