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

-(float)solveArea
{
    float r = _x/2;
    // 0 square, 1 rectangle, 2 equalatrial triangle, 3 circle
    if (_shape==2)
    {
        _area =(_x*_y)/2;
        NSLog(@"triangle");
        return _area;
       
    }else if(_shape==3){
        _area = M_PI * pow(r,2);
        NSLog(@"circle");
        return _area;
       
    }else if (_shape==1){
        _area = (_x*_y);
        NSLog(@"rectangle");
        return _area;
        
    }else if(_shape==0){
        _area = _x * _x;
        NSLog(@"Square");
        return _area;
        
    }
    
}


-(NSString *)question
{
    
    if (_shape==2)
    {
       return [NSString stringWithFormat:@"Find the area of an equalatrial Triangle with a base of %d cm and height of %d cm",_x,_y];
        
    }else if (_shape==3)
    {
        return [NSString stringWithFormat:@"Find the area of a circle with a radius of %d cm",(_x/2)];
    }else if (_shape==0){
        return [NSString stringWithFormat:@"Find the area of a square with a base and height of %d cm",_x];
    }else{
        return [NSString stringWithFormat:@"Find the area of a rectangle with a base of %d cm and height of %d cm",_x,_y];
    }
}


@end
