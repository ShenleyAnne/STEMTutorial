//
//  algebraTutViewController.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 17/01/2013.
//
//

#import <UIKit/UIKit.h>

@interface algebraTutViewController : UIViewController
- (IBAction)swipey:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *tutImages;
@property (nonatomic) int currentImage;

- (IBAction)swipeyToTheLeft:(id)sender;
@end
