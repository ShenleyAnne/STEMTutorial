//
//  algebraDifficulty3.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface algebraDifficulty3 : NSObject

{
    //equation a = (D /or* Y +or-c)* or / e
    
    int _answer; //y
    int _signrandom1; // -/+
    int _number; //D
    int _signrandom2; // * / 
    int _number2; //C
    int _lhs; //a
    int _signAB; // * or /
    int _number3; //e
}

-(void)setanswer:(int)answer;
-(int)answer;

-(void)setnumber2:(int)number2;
-(int)number2;

-(void)setnumber:(int)number;
-(int)number;

-(void)setlhs;
-(int)lhs;

-(void)setsignrandom2:(int)signrandom2;
-(int)signrandom2;

-(void)setsignrandom1:(int)signrandom1;
-(int)signrandom1;

-(void)setsignAB:(int)signAB;
-(int)signAB;

-(void)setnumber3:(int)number3;
-(int)number3;


-(NSString *)equation;

@end
