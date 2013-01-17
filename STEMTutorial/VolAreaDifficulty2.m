//
//  VolAreaDifficulty2.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VolAreaDifficulty2.h"

@implementation VolAreaDifficulty2

// 0 cylinder, 1 squarebased pyramid, 2 cube, 3 cone

-(void)setShape:(int)shape
{ _shape = shape;
}
-(int)shape{
    return _shape;
}

-(void)setVolArea:(int)volArea
{
    _volArea = volArea;
}
-(int)volarea{
    return _volArea;
}

-(void)setX:(int)x
{
    _x = x;
}
-(int)x{
    return _x;
}

-(void)setY:(int)y{
    _y=y;
}
-(int)y{
    return _y;
}

-(void)setZ:(int)z //s in the cases of cones and pyramids
{
    _z=z;
}
-(int)z{
    return _z;
}

// 0 cylinder, 1 squarebased pyramid, 2 cube, 3 cone

-(int)solveArea
{
    float r = _x /2;
    if (_shape==0)
    {   
        _area = (2 * (M_PI * pow(r,2)))+ (2*r*_y);
        return _area;
    } else if (_shape==1)
    {//2*b*s+b^2
        _area = (2*_x*_z)+pow(_x,2);
        return _area;
        
    }else if (_shape ==2){
        _area=6*(pow(_x,2));
        return _area;
    }else if (_shape==3)
    {
        //pi*r*s+pi*r^2
        _area = (M_PI*r*_z) + (M_PI*pow(r,2));
        return _area;
    }
    return 0;
   
}

-(int)solveVolume
{
    float r = _x/2;
    if (_shape==0)
    {
        //pi*r^2*h
        _area = M_PI*pow(r,2)*_y;
        return _area;
    }else if (_shape==1)
    {
        //1/3*b^2*h
        _area = (1/3)*_x*_y;
        return _area;
    }else if (_shape ==2)
    {
        //x^3
        _area = pow(_x,3);
        return _area;
    }else if (_shape==3)
    {
        //1/3 * pi * r^2 * h
        _area = (1/3) * M_PI *pow(r,2)*_y;
        return _area;
    }
}

-(NSString *)questionAREA
{
    if (_shape==0)
    {
    return [NSString stringWithFormat:@"Find the surface area of a cylinder with a radius of %d cm and height of %d cm",(_x/2),_y];
    } else if (_shape ==1)
    {
        return [NSString stringWithFormat:@"Find the surface area of a square based pyramid with a base of %d cm and a slant height of %d cm",_x,_z];
    }else if (_shape==2)
    {
        return [NSString stringWithFormat:@"Find the surface area of a cube with a base of %d cm",_x];
    }else if (_shape ==3)
    {
        return [NSString stringWithFormat:@"Find the surface area of a cone with a radius of %d cm and a slant height of %d cm",(_x/2),_z];
    }
}

-(NSString *) questionVOLUME
{
    if (_shape==0)
    {
        return [NSString stringWithFormat:@"Find the volume of a cylinder with a radius of %d cm and height of %d cm",(_x/2),_y];
    } else if (_shape ==1)
    {
        return [NSString stringWithFormat:@"Find the volume of a square based pyramid with a base of %d cm and a height of %d cm",_x,_y];
    }else if (_shape==2)
    {
        return [NSString stringWithFormat:@"Find the volume of a cube with a base of %d cm",_x];
    }else if (_shape ==3)
    {
        return [NSString stringWithFormat:@"Find the surface area of a cone with a radius of %d cm and a height of %d cm",(_x/2),_y];
    }

}



@end
