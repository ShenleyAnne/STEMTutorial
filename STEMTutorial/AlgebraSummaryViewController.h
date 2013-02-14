//
//  AlgebraSummaryViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 14/12/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlgebraSummaryViewController : UIViewController

@property(nonatomic) int questionCorrect;
@property(nonatomic) int topic;
@property (strong, nonatomic) IBOutlet UITextView *summaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *correctLabel;
- (IBAction)retryButton:(id)sender;
- (IBAction)menuButton:(id)sender;
@end
