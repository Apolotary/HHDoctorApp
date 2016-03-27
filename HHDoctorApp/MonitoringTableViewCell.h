//
//  MonitoringTableViewCell.h
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonitoringDataContainer.h"

@interface MonitoringTableViewCell : UITableViewCell

- (void)setupCellWithMonitoringData:(MonitoringDataContainer *)container;

@end
