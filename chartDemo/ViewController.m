//
//  ViewController.m
//  chartDemo
//
//  Created by Aseem 2 on 10/11/15.
//  Copyright © 2015 codeBrew. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(20, 135.0, SCREEN_WIDTH-40, 200.0)];
    //self.lineChart.yLabelFormat = @"%1.1f";
    //self.lineChart sety
    self.lineChart.backgroundColor = [UIColor clearColor];
    [self.lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5",@"SEP 6",@"SEP 7"]];
 self.lineChart.showCoordinateAxis = YES;
    self.lineChart.showGenYLabels = NO;
    
    //Use yFixedValueMax and yFixedValueMin to Fix the Max and Min Y Value
    //Only if you needed
    self.lineChart.yFixedValueMax = 5000.0;
    self.lineChart.yFixedValueMin = 0.0;
    
    [self.lineChart setYLabels:@[
                                 @"0 min",
                                 @"50 min",
                                 @"100 min",
                                 @"150 min",
                                 @"200 min",
                                 @"250 min",
                                 @"300 min",
                                 ]
     ];
    
    // Line Chart #1
    NSArray * data01Array = @[@600.1, @1600.1, @1260.4, @00.0, @1860.2, @1027.2, @1760.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.dataTitle = @"Alpha";
    //logs
    data01.color = PNFreshGreen;
    data01.alpha = 0.3f;
    data01.itemCount = data01Array.count;
    data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    // Line Chart #2
    NSArray * data02Array = @[@0.0, @1800.1, @260.4, @2002.2, @1206.2, @1670.2, @2760.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.dataTitle = @"Beta";
    data02.color = PNTwitterColor;
    data02.alpha = 0.5f;
    data02.itemCount = data02Array.count;
    data02.inflexionPointStyle = PNLineChartPointStyleNone;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    self.lineChart.chartData = @[data02,data01];
    [self.lineChart strokeChart];
    self.lineChart.delegate = self;
    [self.view addSubview:self.lineChart];
    
    
    self.lineChart.legendStyle = PNLegendItemStyleStacked;
    self.lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    self.lineChart.legendFontColor = [UIColor redColor];
    
    UIView *legend = [self.lineChart getLegendWithMaxWidth:320];
    [legend setFrame:CGRectMake(30, 340, legend.frame.size.width, legend.frame.size.width)];
    [self.view addSubview:legend];
    NSLog(@"%f",self.lineChart.chartCavanHeight);

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex{
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}

- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}

@end
