//
//  algebra3variable.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 20/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface algebra3variable : NSObject

{
    //equation a = D /or* Y +or-c
    
    int _answer; //y
    int _signrandom1; // -/+
    int _number; //D
    int _signrandom2; // * / 
    int _number2; //C
    int _lhs; //a
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

-(NSString *)equation;



@end
