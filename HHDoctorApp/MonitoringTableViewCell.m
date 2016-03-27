//
//  MonitoringTableViewCell.m
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import "MonitoringTableViewCell.h"

@interface MonitoringTableViewCell ()
{
    IBOutlet UILabel *_nameLabel;
    IBOutlet UIView *_chartView;
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
    [_nameLabel setText:[NSString stringWithFormat:@"%@ - %@", container.name, container.unit]];
}

@end
