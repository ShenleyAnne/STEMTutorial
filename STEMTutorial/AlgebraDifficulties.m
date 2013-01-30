//
//  AlgebraDifficulties.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 30/01/2013.
//
//

#import "AlgebraDifficulties.h"

@implementation AlgebraDifficulties


-(NSString*)createQD1
{
    
    _signrandom1 = arc4random()%2;
    _lhs=(arc4random()%14)+1;
    _number=(arc4random()%14)+1;
    
    if (_signrandom1 == 0)
    {
        int ans = 0;
        ans = _lhs - _number;
        _answer = ans;
        return [NSString stringWithFormat:@"%d = Y+%d",_lhs,_number];
        
    }else{
        int ans = 0;
        ans = _lhs + _number;
        _answer = ans;
        return [NSString stringWithFormat:@"%d = Y-%d",_lhs,_number];
    }
    
}

-(NSString *)createQD2

{
    //equation a = D /or* Y +or-c
    _signrandom1=arc4random()%2;
    _signrandom2=arc4random()%2;
    _answer = (arc4random()%20)+1;
    _number2 = (arc4random()%15)+1;
    if (_signrandom1==1)
    {
        int y = _answer;
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:(y)];
        for (int i=1; i<=y;i++)
        {
            if(y%i==0)
            {
                [array addObject:[NSNumber numberWithInt:i]];
            }
        }
        int arraycount = array.count;
        _number=[[array objectAtIndex:(arc4random()%arraycount)]intValue];
        
    }else{
        _number=(arc4random()%14)+1;
    }
    
    if (_signrandom1 == 0)
    {
        if (_signrandom2==0)
        {
            _lhs = 0;
            _lhs = (_answer * _number);
            _lhs = _lhs+_number2;
            return [NSString stringWithFormat:@"%d = Y*%d+%d",_lhs,_number,_number2];
        }else {
            
            _lhs = 0;
            _lhs = (_answer * _number);
            _lhs = _lhs - _number2;
            return [NSString stringWithFormat:@"%d = Y*%d-%d",_lhs,_number,_number2]; 
        }
        
    }else {
        if (_signrandom2==0)
        {
            _lhs = 0;
            _lhs = (_answer / _number);
            _lhs =_lhs + _number2;
            return [NSString stringWithFormat:@"%d = Y/%d+%d",_lhs,_number,_number2];
        }else {
            
            _lhs=0;
            _lhs = (_answer / _number);
            _lhs = _lhs-_number2;
            return [NSString stringWithFormat:@"%d = Y/%d-%d",_lhs,_number,_number2];
            
        }
    }

    
    
    
    
    
}

-(int)answer
{
    return _answer;
    
}


@end
