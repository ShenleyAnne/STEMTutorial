//
//  algebraTestViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 04/03/2013.
//
//

#import <UIKit/UIKit.h>

@interface algebraTestViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *correctLabel;
@property (strong, nonatomic) IBOutlet UITextView *questionTextField;
- (IBAction)quitButton:(id)sender;
- (IBAction)answerAButton:(id)sender;
- (IBAction)answerBbutton:(id)sender;
- (IBAction)answerCbutton:(id)sender;
- (IBAction)answerDbutton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *answerAbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerbbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answercbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerdbuttontext;

@end
