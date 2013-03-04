//
//  trigTestViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 04/03/2013.
//
//

#import <UIKit/UIKit.h>

@interface trigTestViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *correctLabel;
@property (strong, nonatomic) IBOutlet UITextView *questionTextField;

@property (strong, nonatomic) IBOutlet UIButton *answerAbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerbbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answercbuttontext;
@property (strong, nonatomic) IBOutlet UIButton *answerdbuttontext;

- (IBAction)answerAButton:(id)sender;
- (IBAction)answerBButton:(id)sender;
- (IBAction)answerCButton:(id)sender;
- (IBAction)answerDButotn:(id)sender;

- (IBAction)quitButton:(id)sender;

@end
