//
//  AlgebraDifficulties.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 30/01/2013.
//
//

#import <Foundation/Foundation.h>

@interface AlgebraDifficulties : NSObject
{
//Difficulty 1 equation a = y -/+ D

//Difficulty 2 equation a = D /or* Y +or-c
    
//Difficulty 3 equation a = (D /or* Y +or-c)* or / e
    
    
int _answer; //y
int _signrandom1; // -/+
int _number; //D
int _signrandom2; // * /
int _number2; //C
int _lhs; //a
int _signAB; // * or /
int _number3; //e
    
}


-(NSString *)createQD1;

-(NSString *)createQD2;

-(NSString *)createQD3;


-(int)answer;


@end
