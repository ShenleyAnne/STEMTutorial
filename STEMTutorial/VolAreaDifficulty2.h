//
//  VolAreaDifficulty2.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VolAreaDifficulty2 : NSObject

{
    int _shape; // 0 cylinder, 1 squarebased pyramid, 2 cube, 3 cone
    int _volArea; // 0 volume, 1 area
    int _x; //base
    int _y; //height
    int _z; //depth
    int _area; //answer for area questions
    int _volume; //answer for volume questions
    
}

-(void)setShape:(int)shape;
-(int)shape;

-(void)setVolArea:(int)volArea;
-(int)volarea;

-(void)setX:(int)x;
-(int)x;

-(void)setY:(int)y;
-(int)y;

-(void)setZ:(int)z;
-(int)z;

-(int)solveArea;

-(int)solveVolume;

-(NSString *)questionAREA;
-(NSString *)questionVOLUME;

@end
