//
//  trigDifficulties.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/02/2013.
//
//

#import <Foundation/Foundation.h>

@interface trigDifficulties : NSObject


{
    /*
     
     trig ratios in a right angle triangle
     ANGLE A
     .
     . .
     y->.   .
     .    .   <-Z
     .      .
     .-        .
     ..|......... ANGLE B
     ^
     |
     x
     
     
     */
    
    int _z;
    int _x; 
    int _y;
    int _angleA;
    int _angleB;
    int _answer;
}


-(NSString *)createQD1;

-(NSString *)createQD2;

-(NSString *)createQD3;

-(int)answer;

@end
