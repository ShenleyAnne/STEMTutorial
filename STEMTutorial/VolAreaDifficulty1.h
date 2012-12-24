//
//  VolAreaDifficulty1.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VolAreaDifficulty1 : NSObject

{
    int _shape; // 0 square, 1 rectangle, 2 equalatrial triangle, 3 circle
    int _x; //base
    int _y; //height
    int _area; //answer
    
    
}

-(void)setShape:(int)shape;
-(int)shape;

-(void)setX:(int)x;
-(int)x;

-(void)setY:(int)y;
-(int)y;

-(void)setArea:(float)area;
-(float)area;

-(NSString *)question;

@end
