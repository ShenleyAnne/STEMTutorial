//
//  algebra2variable.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "algebra2variable.h"

//Implementation for algebra question difficulty 1
//equations take the format 3=y-2
// where there 3, '-' and 2 are replacable

@implementation algebra2variable

//getters and setters the answer or the left hand side. 
-(void)setanswer:(int)answer
{ _answer = answer;
}
-(int)answer{
    return _answer;
}

//getters and setters for the number in the right hand side of the equation
-(void)setnumber:(int)number
{
    _number = number;
}
-(int)number
{
    return _number;
}

//sets the sign of the equation. 0 is a plus(+) and 1 is a minus(-)
-(void)setsignrandom:(int)signrandom
{ _signrandom = signrandom;
}
-(int)signrandom{
    return _signrandom;
}


//creates the string equation to display to the user
-(NSString *)equation{
    
    if (_signrandom ==0)//so a plus symbol
    {
        return [NSString stringWithFormat:@"%d = Y+%d",_answer,_number];
        
    }else{ //a minus symbol
        return [NSString stringWithFormat:@"%d = Y-%d",_answer,_number];
        
    }
    
}


//solves the equation and return the int which represents the answer the user must find.
-(int)solveEquation
{
    if (_signrandom == 0)
    {
        int ans = 0;
        ans = _answer - _number;
        return ans;
        
    }else{
        int ans = 0;
        ans = _answer + _number;
        return ans;
    }
    
}



@end
