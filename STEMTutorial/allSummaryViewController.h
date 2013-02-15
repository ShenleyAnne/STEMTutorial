//
//  allSummaryViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 14/02/2013.
//
//

#import <UIKit/UIKit.h>

@interface allSummaryViewController : UIViewController

@property(nonatomic) int questionCorrect;
@property(nonatomic) int topic;
@property (strong, nonatomic) IBOutlet UITextView *summaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *correctLabel;
- (IBAction)retryButton:(id)sender;
- (IBAction)menuButton:(id)sender;


@end
