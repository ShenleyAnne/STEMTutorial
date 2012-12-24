//
//  volAreaQuizViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 14/12/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface volAreaQuizViewController : UIViewController
//header file to the view controller that is used when the user is on a volume/area quiz

@property (strong, nonatomic) IBOutlet UILabel *correctAnswer; //label to display how many question user has got right
@property (strong, nonatomic) IBOutlet UILabel *questionNumber; //label to display what question number user is on
@property (strong, nonatomic) IBOutlet UITextView *questionTextfield; //label to display the question
@property (strong, nonatomic) IBOutlet UIButton *answerAbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerbbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answercbuttontext2;

@property (strong, nonatomic) IBOutlet UIButton *answerdbuttontext; //answer buttons - outlet for text etc
- (IBAction)answerAButton:(id)sender;
- (IBAction)answerBbutton:(id)sender;
- (IBAction)answerCButton2:(id)sender;

- (IBAction)answerDbutton:(id)sender; //answer buttons - action


@end
