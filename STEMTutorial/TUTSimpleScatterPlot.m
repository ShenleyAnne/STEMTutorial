//
//  TUTSimpleScatterPlot.m
//  Core Plot Introduction
//
//
//

#import "TUTSimpleScatterPlot.h"

@implementation TUTSimpleScatterPlot
@synthesize hostingView = _hostingView;
@synthesize graph = _graph;
@synthesize graphData = _graphData;
@synthesize myplot =_myplot;

- (BOOL)plotSpace:(CPTPlotSpace *)space shouldHandlePointingDeviceUpEvent:(id)event atPoint:(CGPoint)point
{
    NSLog(@"Raw Point : %.1f, %.1f", point.x, point.y);
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)space;
    
    CPTScatterPlot *scatterPlot = [[[plotSpace graph] allPlots] objectAtIndex:0];
    CGPoint plotAreaPoint = [[plotSpace graph] convertPoint:point toLayer:scatterPlot];
    
    NSLog(@"PlotAreaPoint : %.1f, %.1f", plotAreaPoint.x, plotAreaPoint.y);
    
    NSDecimal dataPoint[2];
    NSDecimalNumber *xCoordinate, *yCoordinate;
    
    [plotSpace plotPoint:dataPoint forPlotAreaViewPoint:plotAreaPoint];
    
    xCoordinate = [NSDecimalNumber decimalNumberWithDecimal:dataPoint[0]];
    yCoordinate = [NSDecimalNumber decimalNumberWithDecimal:dataPoint[1]];
    
    NSLog(@"DataPoint : %.1f, %.1f", [xCoordinate floatValue], [yCoordinate floatValue]);
    
    return YES;
}



// Initialise the scatter plot in the provided hosting view with the provided data.
// The data array should contain NSValue objects each representing a CGPoint.
-(id)initWithHostingView:(CPTGraphHostingView *)hostingView andData:(NSMutableArray *)data
{
    self = [super init];
    
    if ( self != nil ) {
        self.hostingView = hostingView;
        self.graphData = data;
        self.graph = nil;
    }
    
    return self;
}



// This does the actual work of creating the plot if we don't already have a graph object.
-(void)initialisePlot
{
    // Start with some simple sanity checks before we kick off
    if ( (self.hostingView == nil) || (self.graphData == nil) ) {
        NSLog(@"TUTSimpleScatterPlot: Cannot initialise plot without hosting view or data.");
        return;
    }
    if ( self.graph != nil ) {
        
        self.graph = nil;
    }
    
    // Create a graph object which we will use to host just one scatter plot.
    CGRect frame = [self.hostingView bounds];
    self.graph = [[CPTXYGraph alloc] initWithFrame:frame];
    
    // Add some padding to the graph, with more at the bottom for axis labels.
    self.graph.plotAreaFrame.paddingTop = 20.0f;
    self.graph.plotAreaFrame.paddingRight = 20.0f;
    self.graph.plotAreaFrame.paddingBottom = 50.0f;
    self.graph.plotAreaFrame.paddingLeft = 20.0f;
    
	// Tie the graph we've created with the hosting view.
    self.hostingView.hostedGraph = self.graph;
    
    // If you want to use one of the default themes - apply that here.
	//[self.graph applyTheme:[CPTTheme themeNamed:kCPTDarkGradientTheme]];
	
	// Create a line style that we will apply to the axis and data line.
	CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
	lineStyle.lineColor = [CPTColor whiteColor];
	lineStyle.lineWidth = 2.0f;
	
    // Create a text style that we will use for the axis labels.
	CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
	textStyle.fontName = @"Helvetica";
	textStyle.fontSize = 14;
	textStyle.color = [CPTColor whiteColor];
	
    // Create the plot symbol we're going to use.
    CPTPlotSymbol *plotSymbol = [CPTPlotSymbol ellipsePlotSymbol];
    plotSymbol.lineStyle = lineStyle;
    plotSymbol.size = CGSizeMake(1.0, 1.0);
	
    // Setup some floats that represent the min/max values on our axis.
    float xAxisMin = -20;
    float xAxisMax = 20;
    float yAxisMin = -20;
    float yAxisMax = 20;
    
	// We modify the graph's plot space to setup the axis' min / max values.
	CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)self.graph.defaultPlotSpace;
	plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(xAxisMin) length:CPTDecimalFromFloat(xAxisMax - xAxisMin)];
	plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(yAxisMin) length:CPTDecimalFromFloat(yAxisMax - yAxisMin)];
    
    // Modify the graph's axis with a label, line style, etc.
	CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.graph.axisSet;
	
    
	axisSet.xAxis.axisLineStyle = lineStyle;
	axisSet.xAxis.majorTickLineStyle = lineStyle;
	axisSet.xAxis.minorTickLineStyle = lineStyle;
	axisSet.xAxis.labelTextStyle = textStyle;
	axisSet.xAxis.labelOffset = 5.0f;
	axisSet.xAxis.majorIntervalLength = CPTDecimalFromFloat(5.0f);
	axisSet.xAxis.minorTicksPerInterval = 1;
	axisSet.xAxis.minorTickLength = 5.0f;
	axisSet.xAxis.majorTickLength = 7.0f;
	
    
	axisSet.yAxis.axisLineStyle = lineStyle;
	axisSet.yAxis.majorTickLineStyle = lineStyle;
	axisSet.yAxis.minorTickLineStyle = lineStyle;
	axisSet.yAxis.labelTextStyle = textStyle;
	axisSet.yAxis.labelOffset = 5.0f;
	axisSet.yAxis.majorIntervalLength = CPTDecimalFromFloat(5.0f);
	axisSet.yAxis.minorTicksPerInterval = 1;
	axisSet.yAxis.minorTickLength = 5.0f;
	axisSet.yAxis.majorTickLength = 7.0f;
	
	// Add a plot to our graph and axis. We give it an identifier so that we
	// could add multiple plots (data lines) to the same graph if necessary.
	CPTScatterPlot *plot = [[CPTScatterPlot alloc] init] ;
	plot.dataSource = self;
	plot.identifier = @"mainplot";
	plot.dataLineStyle = lineStyle;
	plot.plotSymbol = plotSymbol;
	[self.graph addPlot:plot];
    
    
    plotSpace.delegate = self;
}



// Delegate method that returns the number of points on the plot
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
	if ( [plot.identifier isEqual:@"mainplot"] )
	{
        return [self.graphData count];
	}
	
	return 0;
}

// Delegate method that returns a single X or Y value for a given plot.
-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
	if ( [plot.identifier isEqual:@"mainplot"] )
	{
        NSValue *value = [self.graphData objectAtIndex:index];
        CGPoint point = [value CGPointValue];
        
        // FieldEnum determines if we return an X or Y value.
		if ( fieldEnum == CPTScatterPlotFieldX )
		{
            return [NSNumber numberWithFloat:point.x];
		}
		else	// Y-Axis
		{
            return [NSNumber numberWithFloat:point.y];
		}
	}
	
	return [NSNumber numberWithFloat:0];
}









@end
