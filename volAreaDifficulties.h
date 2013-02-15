//
//  volAreaDifficulties.h
//  STEMTutorial
//
//  Created by Shenley Gallimore on 15/02/2013.
//
//

#import <Foundation/Foundation.h>

@interface volAreaDifficulties : NSObject

{
    int _shapeAreas; // 0 square, 1 rectangle, 2 equalatrial triangle, 3 circle, 4 cylinder, 5 squarebased pyramid, 6 cube, 7 cone 
    int _shapeVols; // 0 cylinder, 1 square based pyramid, 2 cube, 3 cone
    int _volArea; // 0 volume, 1 area
    int _x; //base
    int _y; //height
    int _z; //depth
    int _area; //answer for area questions
    int _volume; //answer for volume questions
    
}

-(NSString *)createQD1;

-(NSString *)createQD2;

-(int)answer;

@end
