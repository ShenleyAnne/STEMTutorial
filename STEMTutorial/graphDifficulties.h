//
//  graphDifficulties.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 01/03/2013.
//
//

#import <Foundation/Foundation.h>

@interface graphDifficulties : NSObject

{
    int _value1;
    int _value2;
    int _symbol;
    
}

-(NSString *)createQD1;

-(NSString *)createQD2;

-(int)getValue1;

-(int)getValue2;

-(int)getSymbol;

@end
