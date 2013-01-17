//
//  trigDifficulty3.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 07/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface trigDifficulty3 : NSObject
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
int _answer;
}

//create an triangle where you have to work out a angle. returns the question
-(NSString *)createTriangle:(int)side1:(int)side2;


-(int)answer;

@end
