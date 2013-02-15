//
//  volAreaDifficulties.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/02/2013.
//
//

#import "volAreaDifficulties.h"

@implementation volAreaDifficulties

-(NSString *) createQD1
{
    _shapeAreas=arc4random()%4;
    _x =(arc4random()%15)+1;
    _y=(arc4random()%15)+1;
    _volArea=1;
    float r = _x/2;
    // 0 square, 1 rectangle, 2 equalatrial triangle, 3 circle
    if (_shapeAreas==2)
    {
        _area =(_x*_y)/2;
       return [NSString stringWithFormat:@"Find the area of an equalatrial Triangle with a base of %d cm and height of %d cm",_x,_y];
        
    }else if(_shapeAreas==3){
        _area = M_PI * pow(r,2);
        return [NSString stringWithFormat:@"Find the area of a circle with a radius of %d cm",(_x/2)];
        
    }else if (_shapeAreas==1){
        _area = (_x*_y);
       return [NSString stringWithFormat:@"Find the area of a square with a base and height of %d cm",_x];
        
    }else if(_shapeAreas==0){
        _area = _x * _x;
       return [NSString stringWithFormat:@"Find the area of a rectangle with a base of %d cm and height of %d cm",_x,_y];
       
        
    }
    
}

-(NSString *)createQD2
{
    _volArea=arc4random()%2;
    _x=(arc4random()%15)+1;
    _y=(arc4random()%15)+1;
    _z=(arc4random()%15)+1;
    if (_volArea==0)//so a volume question
    {
        _shapeVols=arc4random()%4;
        float r = _x/2;
        if (_shapeVols==0)
        {
            //pi*r^2*h
            _area = M_PI*pow(r,2)*_y;
            return [NSString stringWithFormat:@"Find the volume of a cylinder with a radius of %d cm and height of %d cm",(_x/2),_y];
        }else if (_shapeVols==1)
        {
            //1/3*b^2*h
            _area = (1/3)*_x*_y;
           return [NSString stringWithFormat:@"Find the volume of a square based pyramid with a base of %d cm and a height of %d cm",_x,_y];
        }else if (_shapeVols ==2)
        {
            //x^3
            _area = pow(_x,3);
            return [NSString stringWithFormat:@"Find the volume of a cube with a base of %d cm",_x];
        }else if (_shapeVols==3)
        {
            //1/3 * pi * r^2 * h
            _area = (1/3) * M_PI *pow(r,2)*_y;
            return [NSString stringWithFormat:@"Find the surface area of a cone with a radius of %d cm and a height of %d cm",(_x/2),_y];
        }
    }else{
        _shapeAreas=(arc4random()%4)+4;
        float r = _x /2;
        if (_shapeAreas==4)
        {
            _area = (2 * (M_PI * pow(r,2)))+ (2*r*_y);
            return [NSString stringWithFormat:@"Find the surface area of a cylinder with a radius of %d cm and height of %d cm",(_x/2),_y];
        } else if (_shapeAreas==5)
        {//2*b*s+b^2
            _area = (2*_x*_z)+pow(_x,2);
            return [NSString stringWithFormat:@"Find the surface area of a square based pyramid with a base of %d cm and a slant height of %d cm",_x,_z];
            
        }else if (_shapeAreas ==6){
            _area=6*(pow(_x,2));
            return [NSString stringWithFormat:@"Find the surface area of a cube with a base of %d cm",_x];
        }else if (_shapeAreas==7)
        {
            //pi*r*s+pi*r^2
            _area = (M_PI*r*_z) + (M_PI*pow(r,2));
            return [NSString stringWithFormat:@"Find the surface area of a cone with a radius of %d cm and a slant height of %d cm",(_x/2),_z];
            
        }
        
        
    }
    
    
}

-(int) answer
{
    if(_volArea==0)//checks whether it's been a volume or area question
    {
        return _volume;
    }else{
        return _area;
    }
    
    
}

@end
