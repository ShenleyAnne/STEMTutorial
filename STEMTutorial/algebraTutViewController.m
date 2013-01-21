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
    self.currentImage=1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)swipey:(id)sender {
    
 
      if (self.currentImage==1)
      {
          NSString *imageString = [NSString stringWithFormat:@"%d.jpg",11];
          self.currentImage= 11;
          [self swipeRightAction:imageString];
      }else{
          NSString *imageString = [NSString stringWithFormat:@"%d.jpg",([self currentImage]-1)];
          self.currentImage= ([self currentImage]-1);
          [self swipeRightAction:imageString];
          
      }
      
  
    
   
    
}

- (IBAction)swipeyToTheLeft:(id)sender {
    
    if (self.currentImage==11)
    {
        NSString *imageString = [NSString stringWithFormat:@"%d.jpg",1];
        self.currentImage= 1;
        [self swipeLeftAction:imageString];
    }else{
        NSString *imageString = [NSString stringWithFormat:@"%d.jpg",([self currentImage]+1)];
        self.currentImage= ([self currentImage]+1);
        [self swipeLeftAction:imageString];
        
    }
}

-(void)swipeLeftAction:(NSString *)inString
{
    [UIView transitionWithView:self.tutImages
                      duration:0.10f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        self.tutImages.image = [UIImage imageNamed:inString];
                    } completion:nil];
    
}

-(void)swipeRightAction:(NSString *)inString
{
    
    [UIView transitionWithView:self.tutImages
                      duration:0.10f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        self.tutImages.image = [UIImage imageNamed:inString];
                    } completion:nil];
    
}



- (void)viewDidUnload {
    [self setTutImages:nil];
    [super viewDidUnload];
}


@end
