//
//  trigSummaryViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 16/01/2013.
//
//

#import <UIKit/UIKit.h>

@interface trigSummaryViewController : UIViewController

@property(nonatomic) int questionCorrect;

@property (strong, nonatomic) IBOutlet UITextView *summaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *correctLabel;
- (IBAction)retryButton:(id)sender;
- (IBAction)menuButton:(id)sender;

@end
