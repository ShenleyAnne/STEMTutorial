//
//  VolAreaDifficulty2.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VolAreaDifficulty2.h"

@implementation VolAreaDifficulty2

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

-(void)setZ:(int)z
{
    _z=z;
}
-(int)z{
    return _z;
}

// 0 cylinder, 1 squarebased pyramid, 2 cube, 3 cone

-(void)setArea:(float)area
{
    if (_shape==0)
    {   float r = _x /2;
        _area = (2 * (M_PI * pow(r,2)))+ (2*r*_y);
    }
}


@end
