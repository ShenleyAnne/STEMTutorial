//
//  trigDifficulty2.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 07/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface trigDifficulty2 : NSObject

{
    
    
    /*
     
     trig ratios in a right angle triangle
     
     . 
     . .
  y->.   .  
     .    .   <-Z
     .      .
     .-        . 
     ..|.........
     ^
     |
     x
     
     
     */
    
    int _z;
    int _x; 
    int _y;
    int _angleA;
    int _angleB;
    int sohcahtoaTYPE;
    
}

//create an triangle where you have to work out a side.
-(Boolean)createTriangleSA:(int)side:(int)angle;


-(NSString *)question;

-(float)solveQuestion;


@end
