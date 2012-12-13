//
//  algebraDifficulty3.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "algebraDifficulty3.h"

@implementation algebraDifficulty3



-(void)setanswer:(int)answer
{ _answer = answer;
}
-(int)answer{
    return _answer;
}

-(int)lhs{
    return _lhs;
}


-(void)setnumber:(int)number
{
    _number = number;
}
-(int)number
{
    return _number;
}

-(void)setnumber2:(int)number2
{
    _number2 = number2;
}
-(int)number2
{
    return _number2;
}

-(void)setnumber3:(int)number3
{
    _number3 = number3;
}
-(int)number3
{
    return _number3;
}


-(void)setsignrandom1:(int)signrandom1
{ _signrandom1 = signrandom1;
}
-(int)signrandom1{
    return _signrandom1;
}
// 0 is a * and 1 division /


-(void)setsignrandom2:(int)signrandom2
{ _signrandom2 = signrandom2;
}
-(int)signrandom2{
    return _signrandom2;
}
// 0 is a plus symbol and 1 is a minus symbol

-(void)setsignAB:(int)signAB
{ _signAB = signAB;
}
-(int)signAB{
    return _signAB;
}
// 0 is a + and 1 is a - 

-(NSString *)equation{
    
    if (_signrandom1 ==0)//multi
    {
        if ((_signrandom2==0)&&(_signAB==0))//plus
           
        {
            return [NSString stringWithFormat:@"%d = (Y*%d+%d)+%d",_lhs,_number,_number2,_number3];
        }else if ((_signrandom2==1)&&(_signAB==0)){
            return [NSString stringWithFormat:@"%d = (Y*%d-%d)+%d",_lhs,_number,_number2,_number3];  
        }else if ((_signrandom2==0)&&(_signAB==1))
        {
            return [NSString stringWithFormat:@"%d = (Y*%d+%d)-%d",_lhs,_number,_number2,_number3];
        }else{
            return [NSString stringWithFormat:@"%d = (Y*%d-%d)-%d",_lhs,_number,_number2,_number3];
        }
                
        
    }else{ //division
        if ((_signrandom2==0)&&(_signAB==0))//
        {
            return [NSString stringWithFormat:@"%d = (Y/%d+%d)+%d",_lhs,_number,_number2,_number3];
        }else if ((_signrandom2==1)&&(_signAB==0)){
            return [NSString stringWithFormat:@"%d = (Y/%d-%d)+%d",_lhs,_number,_number2,_number3];
        }else if ((_signrandom2==0)&&(_signAB==1)){
            return [NSString stringWithFormat:@"%d = (Y/%d+%d)-%d",_lhs,_number,_number2,_number3];
        }else{
            return [NSString stringWithFormat:@"%d = (Y/%d-%d)-%d",_lhs,_number,_number2,_number3];
    }
    
}
}


-(void)setlhs
{
    if (_signrandom1 == 0)
    {
        if ((_signrandom2==0)&&(_signAB==0))
        {
            _lhs = 0;
            _lhs = (_answer * _number);
            _lhs = _lhs+_number2;
            _lhs = _lhs + _number3;
            //  return _lhs;
        }else if ((_signrandom2==1)&&(_signAB==0)) {
            
            _lhs = 0;
            _lhs = (_answer * _number);
            _lhs = _lhs - _number2;
            _lhs = _lhs + _number3;
            // return _lhs;
        }else if ((_signrandom2==0)&&(_signAB==1)) {
            
            _lhs = 0;
            _lhs = (_answer * _number);
            _lhs = _lhs + _number2;
            _lhs = _lhs - _number3;
            // return _lhs;
        }else {
            
            _lhs = 0;
            _lhs = (_answer * _number);
            _lhs = _lhs - _number2;
            _lhs = _lhs - _number3;
            // return _lhs;
        }
        
    }else {
        if ((_signrandom2==0)&&(_signAB==0))
        {
            _lhs = 0;
            _lhs = (_answer / _number);
            _lhs =_lhs + _number2;
            _lhs = _lhs + _number3;
            // return _lhs;
        }else if ((_signrandom2==1)&&(_signAB==0)){
            
            _lhs=0;
            _lhs = (_answer / _number);
            _lhs = _lhs-_number2;
            _lhs = _lhs + _number3;
            // return _lhs;
            
        }else if ((_signrandom2==0)&&(_signAB==1)){
            
            _lhs=0;
            _lhs = (_answer / _number);
            _lhs = _lhs + _number2;
            _lhs = _lhs - _number3;
            // return _lhs;
        }else{
            _lhs=0;
            _lhs = (_answer / _number);
            _lhs = _lhs - _number2;
            _lhs = _lhs - _number3;
        }
    }
    
}


@end
