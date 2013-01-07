//
//  trigQuizViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 03/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface trigQuizViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *questionNumber;
@property (strong, nonatomic) IBOutlet UILabel *correctAnswer;
@property (strong, nonatomic) IBOutlet UITextView *questionTextField;

@property (strong, nonatomic) IBOutlet UIButton *answerAbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerbbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answercbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerdbuttontext;

- (IBAction)answerAButton:(id)sender;
- (IBAction)answerCbutton:(id)sender;
- (IBAction)answerDbutton:(id)sender;
- (IBAction)answerBButton2:(id)sender;

@end
