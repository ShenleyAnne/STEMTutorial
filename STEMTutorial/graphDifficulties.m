//
//  graphDifficulties.m
//  STEMTutorial
//
//  Created by Shenley Gallimore on 01/03/2013.
//
//

#import "graphDifficulties.h"

@implementation graphDifficulties

-(NSString *)createQD1
{
    //y=value1x + or - value2
    _value1 = (arc4random()%4)+2;
    _value2 = (arc4random()%5);
    _symbol = arc4random()%2;
    
    if (_symbol==0)
    {
        
        return ([NSString stringWithFormat:@"Draw the graph Y=%dX + %d",_value1,_value2]);
    }else
    {
        
        return ([NSString stringWithFormat:@"Draw the graph Y=%dX- %d",_value1,_value2]);
    }
    
}

-(NSString *)createQD2
{
    //y=x^value1+ or - value2
    _value1 = (arc4random()%2)+2;
    _value2 = (arc4random()%5);
    _symbol = arc4random()%2;
    
    if (_symbol==0)
    {
        
        return ([NSString stringWithFormat:@"Draw the graph Y=X^%d + %d",_value1,_value2]);
    }else
    {
        
        return ([NSString stringWithFormat:@"Draw the graph Y=X^%d- %d",_value1,_value2]);
    }
    
}

-(int)getValue1
{
    return _value1;
    
}

-(int)getValue2
{
    return _value2;
    
}

-(int)getSymbol;
{
    return _symbol;
}
@end
