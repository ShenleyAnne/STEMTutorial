//
//  algebraTutViewController.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 17/01/2013.
//
//

#import "algebraTutViewController.h"

@interface algebraTutViewController ()

@end

@implementation algebraTutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)swipey:(id)sender {
    
    [UIView transitionWithView:self.tutImages
                      duration:0.25f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        self.tutImages.image = [UIImage imageNamed:@"2.jpg"];
                    } completion:nil];
    
    
}
- (void)viewDidUnload {
    [self setTutImages:nil];
    [super viewDidUnload];
}
@end
