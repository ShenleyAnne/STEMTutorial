//
//  trigDifficulties.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/02/2013.
//
//

#import "trigDifficulties.h"

@implementation trigDifficulties

-(NSString *)createQD1{
    _x = (arc4random()%15)+1;
    _y = (arc4random()%15)+1;
    float z = pow(_x,2)+pow(_y,2);
    z = sqrtf(z);
    _answer=z;
    return [NSString stringWithFormat:@"Find the length of the side labelled Z in the right angled triangle where the x is %d cm and y is %d cm",_x,_y];
}


-(NSString *)createQD2
{
    int whichSide = arc4random()%3;
    int whichAngle = arc4random()%2;
    int toFind = arc4random()%2;
    int side = (arc4random()%15)+1;
    int angle = (arc4random()%90)+1;
    
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

-(NSString *)createQD3
{
    
    int comboNumber = arc4random()%3;//0 is X + Z, 1 is X+Y, 2 is Y +Z
    int toFind = arc4random()%2;
    int side1 = (arc4random()%15)+1;
    int side2 = (arc4random()%15)+1;
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

-(int)answer
{
    return _answer;
    
}



@end
