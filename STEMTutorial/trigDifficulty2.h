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
    ANGLE A 
     . 
     . .
  y->.   .  
     .    .   <-Z
     .      .
     .-        . 
     ..|......... ANGLE B
     ^
     |
     x
     
     
     */
    
    int _z;
    int _x; 
    int _y;
    int _angleA;
    int _angleB;
    float _answer;
    
}

//create an triangle where you have to work out a side. returns the question
-(NSString *)createTriangleSA:(int)side:(int)angle;


-(float)answer;


@end
