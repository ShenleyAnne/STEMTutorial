//
//  algebraQuizViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface algebraQuizViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *questionTextfield;
- (IBAction)answerAButton:(id)sender;
- (IBAction)answerBbutton:(id)sender;
- (IBAction)answerCbutton:(id)sender;
- (IBAction)answerDbutton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *questionNumber;

@property (strong, nonatomic) IBOutlet UILabel *coorectAnswers;
@property (strong, nonatomic) IBOutlet UIButton *answerAbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerbbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answercbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerdbuttontext;




@end
