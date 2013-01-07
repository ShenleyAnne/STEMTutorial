//
//  trigDifficulty2.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 07/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "trigDifficulty2.h"

@implementation trigDifficulty2





-(NSString *)createTriangleSA:(int)side:(int)angle
{
    //creates the triangle, returns the question and solves the answer
    int whichSide = arc4random()%3;
    int whichAngle = arc4random()%2;
    int toFind = arc4random()%2;
    
    // 0=soh, 1=cah, 2=toa
    
    if (whichSide==0)
    //x
    {    
        _x = side;
        if(whichAngle==0)
        {
            _angleA = angle;
            if (toFind==0)
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleA;
                //find Y where angle A is something and x is. TOA, tan(angle)=x/y
                _answer=_x/tan(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Y in the right angled triangle where the x is %d cm and angle A is %d",_x,_angleA];
                
            }else
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleA;
                //find Z where angle A is something and x is. SOH, sin(angle)=x/z
                _answer=_x/sin(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Z in the right angled triangle where the x is %d cm and angle A is %d",_x,_angleA];
                
            }
            
            
        }else{
            _angleB=angle;
            if (toFind==0)
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleB;
                //find Y where angle A is something and x is. TOA, tan(angle)=x/y
                _answer=_x/tan(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Y in the right angled triangle where the x is %d cm and angle A is %d",_x,_angleB];
                
            }else
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleB;
                //find Z where angle A is something and x is. CAH, cos(angle)=x/z
                _answer=_x/cos(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Z in the right angled triangle where the x is %d cm and angle A is %d",_x,_angleB];
                
            }
        }
        
    }else if (whichSide==1)
        //y
    {
        _y=side;
        if(whichAngle==0)
        {
            _angleA = angle;
            if (toFind==0)
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleA;
                //find X where angle A is something and Y is. TOA, tan(angle)=x/y
                _answer=_y/tan(degreesToRadians);
               return [NSString stringWithFormat:@"Find the length of the side labelled Y in the right angled triangle where the x is %d cm and angle A is %d",_y,_angleA];
                
            }else
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleA;
                //find Z where angle A is something and Y is. CAH, cos(angle)=x/z
                _answer=_y/cos(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Z in the right angled triangle where the x is %d cm and angle A is %d",_y,_angleA];
                
            }
            
        }else{
            _angleB=angle;
            
            _angleA = angle;
            if (toFind==0)
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleB;
                //find X where angle B is something and Y is. TOA, tan(angle)=y/x
                _answer=_y/tan(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Y in the right angled triangle where the x is %d cm and angle B is %d",_y,_angleB];
                
            }else
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleB;
                //find Z where angle B is something and Y is. SOH, sin(angle)=y/z
                _answer=_y/sin(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Z in the right angled triangle where the x is %d cm and angle B is %d",_y,_angleB];
                
            }
        }
    
        
    }else
        //z
    {
        _z=side;
        if(whichAngle==0)
        {
            _angleA = angle;
            
            if (toFind==0)
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleA;
                //find X where angle A is something and Z is. SOH, tan(angle)=x/z
                _answer=_z*sin(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Y in the right angled triangle where the z is %d cm and angle A is %d",_z,_angleA];
                
            }else
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleA;
                //find Z where angle B is something and Y is. CAH, cos(angle)=y/z
                _answer=_z*cos(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Z in the right angled triangle where the z is %d cm and angle A is %d",_z,_angleA];
                
            }
        }else{
            _angleB=angle;
            if (toFind==0)
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleB;
                //find Y where angle B is something and Z is. SOH, sin(angle)=y/z
                _answer=_z*sin(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled Y in the right angled triangle where the z is %d cm and angle B is %d",_z,_angleB];
                
            }else
            {
                //convert from degrees to rads
                double degreesToRadians = 2 * M_PI/ 360 * _angleA;
                //find X where angle B is something and z is. CAH, cos(angle)=x/z
                _answer=_z*cos(degreesToRadians);
                return [NSString stringWithFormat:@"Find the length of the side labelled X in the right angled triangle where the z is %d cm and angle A is %d",_z,_angleB];
                
            }
            
        }
        
        
    }
    
    
   
    
}

-(float)answer
{
    return _answer;
}




@end
