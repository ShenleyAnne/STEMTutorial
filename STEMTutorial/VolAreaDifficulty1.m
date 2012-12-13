//
//  VolAreaDifficulty1.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VolAreaDifficulty1.h"

@implementation VolAreaDifficulty1

-(void)setShape:(int)shape
{ _shape = shape;
}
-(int)shape{
    return _shape;
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

-(void)setArea:(int)area
{
    // 0 square, 1 rectangle, 2 equalatrial triangle, 3 circle
    if (_shape==2)
    {
        _area =(_x*_y)/2;
    }else{
        _area = (_x*_y);
    }
    
}
-(int)area{
    return _area;
}


@end
