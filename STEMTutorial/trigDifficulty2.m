//
//  trigDifficulty2.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 07/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "trigDifficulty2.h"

@implementation trigDifficulty2
/*
//set the x in the triangle
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


//for the Z in the triangle
-(void)setZ:(int)z
{
    _z=z;
}
-(int)z
{
    return _z;
}
 */

-(Boolean)createTriangleSA:(int)side:(int)angle
{
    int whichSide = arc4random()%3;
    int whichAngle = arc4random()%2;
    sohcahtoaTYPE = arc4random()%3;
    // 0=soh, 1=cah, 2=toa
    
    if (whichSide==0)
    //x
    {    
        _x = side;
        
    }else if (whichSide==1)
        //y
    {
        _y=side;
    
        
    }else
        //z
    {
        _z=side;
        
        
    }
    if(whichAngle==0)
    {
        _angleA=angle;   
        
    }else
    {
        _angleB=angle;
    }
    
   
        return true;
    
}





@end
