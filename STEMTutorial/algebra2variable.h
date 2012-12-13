//
//  algebra2variable.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface algebra2variable : NSObject
{
    //equation a = y -/+ c
    
    int _answer; //a
    int _signrandom; // -/+
    int _number; //c
}

-(void)setanswer:(int)answer;
-(int)answer;



-(void)setnumber:(int)number;
-(int)number;

-(void)setsignrandom:(int)signrandom;
-(int)signrandom;

-(NSString *)equation;

-(int)solveEquation;

@end
