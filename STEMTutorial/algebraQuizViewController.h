//
//  algebraQuizViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface algebraQuizViewController : UIViewController

//header file to the view controller that is used when the user is on a algebra quiz

@property (strong, nonatomic) IBOutlet UITextView *questionTextfield; //where the question is displaed
- (IBAction)answerAButton:(id)sender;
- (IBAction)answerBbutton:(id)sender;
- (IBAction)answerCbutton:(id)sender;
- (IBAction)answerDbutton:(id)sender; //Answer buttons - action
@property (strong, nonatomic) IBOutlet UILabel *questionNumber;//text field to display which question number the user is on
@property (strong, nonatomic) IBOutlet UILabel *coorectAnswers;//text field to display how many correct answers they have so far
@property (strong, nonatomic) IBOutlet UIButton *answerAbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerbbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answercbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerdbuttontext; //Answer buttons - outlets, for text etc.
- (IBAction)quitButton:(id)sender;




@end
