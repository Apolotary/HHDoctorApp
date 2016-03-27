//
//  MonitoringViewController.m
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import "MonitoringViewController.h"
#import "MonitoringTableViewCell.h"
#import "PatientDataManager.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface MonitoringViewController () <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *_tableView;
    NSArray *_monitoringData;
}


@end

@implementation MonitoringViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [[PatientDataManager sharedManager] createMonitoringData];
    _monitoringData = [[[PatientDataManager sharedManager] mainPatient] monitoringData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _monitoringData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MonitoringTableViewCell *cell = (MonitoringTableViewCell *) [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
    {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"MonitoringTableViewCell" owner:nil options:nil];
        
        for (id obj in nibArray)
        {
            if ([obj isKindOfClass:[MonitoringTableViewCell class]])
            {
                cell = (MonitoringTableViewCell *)obj;
                break;
            }
        }
    }
    
    [cell setupCellWithMonitoringData:_monitoringData[indexPath.row]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
