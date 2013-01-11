//
//  trigDifficulty3.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 07/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "trigDifficulty3.h"

@implementation trigDifficulty3

-(NSString *)createTriangle:(int)side1:(int)side2
{
    int comboNumber = arc4random()%3;//0 is X + Z, 1 is X+Y, 2 is Y +Z
    int toFind = arc4random()%2;
    
    
    if((comboNumber==0)&&(toFind==0))
    {
        //x and z found, find A
        //x is side1, z is side2
        _x=side1;
        _z=side2;
        float temp = _x/_z;
        _answer= asinf(temp)*180/M_PI;
        return [NSString stringWithFormat:@"Find the size of the Angle A in the right angled triangle where the x is %d cm and z is %d cm",_x,_z];
        
    }else if ((comboNumber==0)&&(toFind==1))
    {
        //x and z found, find B
        //x is side1, z is side2
        _x=side1;
        _z=side2;
        float temp = _x/_z;
        _answer= acosf(temp)*180/M_PI;
        return [NSString stringWithFormat:@"Find the size of the Angle B in the right angled triangle where the x is %d cm and z is %d cm",_x,_z];
        
    }else if ((comboNumber==1)&&(toFind==0))
    {
        //X and y, find A
        _x=side1;
        _y=side2;
        _answer= atan2f(_x, _y)*180/M_PI;
        return [NSString stringWithFormat:@"Find the size of the Angle A in the right angled triangle where the x is %d cm and y is %d cm",_x,_y];
        
        
    }else if ((comboNumber==1)&&(toFind==1))
    {
        //X and y, find B
        _x=side1;
        _y=side2;
        _answer= atan2f(_y, _x)*180/M_PI;
        return [NSString stringWithFormat:@"Find the size of the Angle B in the right angled triangle where the x is %d cm and y is %d cm",_x,_y];
        
        
    }else if ((comboNumber==2)&&(toFind==0))
    {
        //Y and Z. Find A
        _y=side1;
        _z=side2;
        float temp = _y/_z;
        _answer= acosf(temp)*180/M_PI;
        return [NSString stringWithFormat:@"Find the size of the Angle A in the right angled triangle where the y is %d cm and z is %d cm",_y,_z];
        
        
    }else{
        
        //y and z. find B
        
        _y = side1;
        _z = side2;
        float temp = _y/_z;
        _answer=asinf(temp)*180/M_PI;
        return [NSString stringWithFormat:@"Find the size of the Angle B in the right angled triangle where the y is %d cm and z is %d cm",_y,_z];
        
    }
    
    
    
}


-(float)answer{
    
    return _answer;
}

@end
