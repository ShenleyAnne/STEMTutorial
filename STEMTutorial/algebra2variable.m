//
//  algebra2variable.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "algebra2variable.h"

//equations take the format 3=y-2
// where there 3, '-' and 2 are replacable

@implementation algebra2variable

-(void)setanswer:(int)answer
{ _answer = answer;
}
-(int)answer{
    return _answer;
}


-(void)setnumber:(int)number
{
    _number = number;
}
-(int)number
{
    return _number;
}


-(void)setsignrandom:(int)signrandom
{ _signrandom = signrandom;
}
-(int)signrandom{
    return _signrandom;
}
// 0 is a plus symbol and 1 is a symbol


-(NSString *)equation{
    
    if (_signrandom ==0)//so a plus symbol
    {
        return [NSString stringWithFormat:@"%d = Y+%d",_answer,_number];
        
    }else{ //a minus symbol
        return [NSString stringWithFormat:@"%d = Y-%d",_answer,_number];
        
    }
    
}

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
