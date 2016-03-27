//
//  MonitoringTableViewCell.m
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import "MonitoringTableViewCell.h"
#import "HHDoctorApp-Swift.h"

@interface MonitoringTableViewCell () <ChartViewDelegate>
{
    IBOutlet UILabel *_nameLabel;
    IBOutlet BarChartView *_chartView;
    MonitoringDataContainer *_container;
}

@end

@implementation MonitoringTableViewCell

#pragma mark - Cell methods

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Setting up the cell

- (void)setupCellWithMonitoringData:(MonitoringDataContainer *)container
{
    _container = container;
    
    NSNumber *max=[_container.data valueForKeyPath:@"@max.doubleValue"];
    [_nameLabel setText:[NSString stringWithFormat:@"%@ - %@", container.name, container.unit]];
    
    _chartView.descriptionText = @"";
    _chartView.noDataTextDescription = @"You need to provide data for the chart.";
    
    _chartView.drawGridBackgroundEnabled = NO;
    
    _chartView.dragEnabled = NO;
    [_chartView setScaleEnabled:NO];
    _chartView.pinchZoomEnabled = NO;
    
    // ChartYAxis *leftAxis = chartView.leftAxis;
    
    ChartXAxis *xAxis = _chartView.xAxis;
    
    xAxis.labelPosition = XAxisLabelPositionBottom;
    
    _chartView.rightAxis.enabled = NO;
    _chartView.delegate = self;
    
    _chartView.drawBarShadowEnabled = NO;
    _chartView.drawValueAboveBarEnabled = YES;
    
    _chartView.maxVisibleValueCount = 60;
    
    xAxis = _chartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelFont = [UIFont systemFontOfSize:10.f];
    xAxis.drawGridLinesEnabled = NO;
    xAxis.spaceBetweenLabels = 2.0;
    
    _chartView.legend.enabled = NO;
    
    _chartView.leftAxis.enabled = NO;
    
    _chartView.userInteractionEnabled = NO;
    
    [_chartView animateWithYAxisDuration:0.5];
    [self setDataCount:7 range:max.doubleValue];
}

- (void)setDataCount:(int)count range:(double)range
{
    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        [xVals addObject:@(i+1)];
    }
    
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        [yVals addObject:[[BarChartDataEntry alloc] initWithValue:[_container.data[i] floatValue] xIndex:i]];
    }
    
    BarChartDataSet *set1 = [[BarChartDataSet alloc] initWithYVals:yVals label:@"DataSet"];
    set1.barSpace = 0.35;
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set1];
    
    BarChartData *data = [[BarChartData alloc] initWithXVals:xVals dataSets:dataSets];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.f]];
    
    _chartView.data = data;
}




@end
