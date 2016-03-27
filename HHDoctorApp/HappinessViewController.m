//
//  HappinessViewController.m
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import "HappinessViewController.h"
#import "HHDoctorApp-Swift.h"
#import "PatientDataManager.h"
#import "MonitoringDataContainer.h"

@interface HappinessViewController () <ChartViewDelegate>
{
    IBOutlet RadarChartView *_chartView;
    NSArray *_monitoringData;
}

@end

@implementation HappinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _chartView.delegate = self;
    
    _chartView.descriptionText = @"";
    _chartView.webLineWidth = .75;
    _chartView.innerWebLineWidth = 0.375;
    _chartView.webAlpha = 1.0;
    
    ChartXAxis *xAxis = _chartView.xAxis;
    xAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:9.f];
    
    ChartYAxis *yAxis = _chartView.yAxis;
    yAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:9.f];
    yAxis.labelCount = 5;
    yAxis.customAxisMin = 0.0;
    
    ChartLegend *l = _chartView.legend;
    l.position = ChartLegendPositionRightOfChart;
    l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.f];
    l.xEntrySpace = 7.0;
    l.yEntrySpace = 5.0;
    
    [self setChartData];
    [_chartView animateWithXAxisDuration:1.4 yAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float)getAverageValue:(NSArray *)array
{
    float average = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
    float max= [[array valueForKeyPath:@"@max.doubleValue"] floatValue];
    return (average * 100) / max;
}

- (void)setChartData
{
    int count = 6;
    
    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    
    _monitoringData = [[[PatientDataManager sharedManager] mainPatient] monitoringData];
    
    for (int i = 0; i < count; i++)
    {
        MonitoringDataContainer *container = _monitoringData[i];
        [yVals1 addObject:[[ChartDataEntry alloc] initWithValue:[self getAverageValue:container.data] xIndex:i]];
    }
    
    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        MonitoringDataContainer *container = _monitoringData[i];
        [xVals addObject:container.name];
    }
    
    _chartView.legend.enabled = NO;
    
    _chartView.userInteractionEnabled = NO;
    
    RadarChartDataSet *set1 = [[RadarChartDataSet alloc] initWithYVals:yVals1 label:@"Set 1"];
    [set1 setColor:ChartColorTemplates.vordiplom[0]];
    set1.fillColor = ChartColorTemplates.vordiplom[0];
    set1.drawFilledEnabled = YES;
    set1.lineWidth = 2.0;

    
    RadarChartData *data = [[RadarChartData alloc] initWithXVals:xVals dataSets:@[set1]];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:8.f]];
    [data setDrawValues:NO];
    
    _chartView.data = data;
    

}

@end
