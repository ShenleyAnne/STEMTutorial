//
//  algebra3variable.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 20/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "algebra3variable.h"

@implementation algebra3variable

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

-(NSString *)equation{
    
    if (_signrandom1 ==0)//multi
    {
        if (_signrandom2==0)//plus
        {
            return [NSString stringWithFormat:@"%d = Y*%d+%d",_lhs,_number,_number2];
        }else{ //minus
            return [NSString stringWithFormat:@"%d = Y*%d-%d",_lhs,_number,_number2];  
        }
        
    }else{ //division
        if (_signrandom2==0)//plus
        {
            return [NSString stringWithFormat:@"%d = Y/%d+%d",_lhs,_number,_number2];
        }else{//minus
            return [NSString stringWithFormat:@"%d = Y/%d-%d",_lhs,_number,_number2];
        }
        
    }
    
}



-(void)setlhs
{
    if (_signrandom1 == 0)
    {
        if (_signrandom2==0)
        {
            _lhs = 0;
            _lhs = (_answer * _number);
            _lhs = _lhs+_number2;
          //  return _lhs;
        }else {
            
            _lhs = 0;
            _lhs = (_answer * _number);
            _lhs = _lhs - _number2;
           // return _lhs;
        }
        
    }else {
        if (_signrandom2==0)
        {
            _lhs = 0;
            _lhs = (_answer / _number);
            _lhs =_lhs + _number2;
           // return _lhs;
        }else {
            
            _lhs=0;
            _lhs = (_answer / _number);
            _lhs = _lhs-_number2;
           // return _lhs;
            
        }
    }
    
}


@end
