//
//  TUTSimpleScatterPlot.h
//  Core Plot Introduction
//
//  
//

#import <Foundation/Foundation.h>
#import "CorePlot-CocoaTouch.h"

@interface TUTSimpleScatterPlot : NSObject <CPTScatterPlotDataSource,CPTPlotSpaceDelegate> {
	CPTGraphHostingView *_hostingView;	
	CPTXYGraph *_graph;
	NSMutableArray *_graphData;
    CPTScatterPlot *_myplot;
}

@property (nonatomic, retain) CPTGraphHostingView *hostingView;
@property (nonatomic, retain) CPTXYGraph *graph;
@property (nonatomic, retain) NSMutableArray *graphData;
@property (nonatomic, retain) CPTScatterPlot *myplot;

// Methods to create this object and attach it to it's hosting view.
+(TUTSimpleScatterPlot *)plotWithHostingView:(CPTGraphHostingView *)hostingView andData:(NSMutableArray *)data;
-(id)initWithHostingView:(CPTGraphHostingView *)hostingView andData:(NSMutableArray *)data;

// Specific code that creates the scatter plot.
-(void)initialisePlot;



@end
