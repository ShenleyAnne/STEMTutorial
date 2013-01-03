//
//  trigDifficulty1.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 03/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface trigDifficulty1 : NSObject
{
/*

   . 
   . .
Y->.  .
   .    .   <-Z
   .      .
   .-        . 
   ..|.........
    ^
    |
    x
 
 
*/
    

int _x; 
int _y;     
    
}

-(void)setX:(int)x;
-(int)x;

-(void)setY:(int)y;
-(int)y;


-(NSString *)question;

-(float)solveZ;






@end
