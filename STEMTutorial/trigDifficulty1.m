//
//  trigDifficulty1.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 03/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "trigDifficulty1.h"

@implementation trigDifficulty1

//getters and setters the x in the triangle 
-(void)setX:(int)x
{ _x = x;
}
-(int)x{
    return _x;
}

//for the Y in the triangle
-(void)setY:(int)y
{
    _y = y;
}
-(int)y
{
    return _y;
}

-(NSString *)question
{
    return [NSString stringWithFormat:@"Find the length of the side labelled Z in the right angled triangle where the x is %d cm and y is %d cm",_x,_y];
    
}

-(float)solveZ{
    float z = pow(_x,2)+pow(_y,2);
    z = sqrtf(z);
    return z;
}




@end
