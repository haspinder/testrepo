//
//  ViewController.h
//  chartDemo
//
//  Created by Aseem 2 on 10/11/15.
//  Copyright © 2015 codeBrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PNChart.h>

@interface ViewController : UIViewController<PNChartDelegate>

@property (nonatomic) PNLineChart * lineChart;

@end

