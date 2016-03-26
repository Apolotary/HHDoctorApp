//
//  MonitoringDataContainer.m
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import "MonitoringDataContainer.h"

@implementation MonitoringDataContainer

- (instancetype)initWithName:(NSString *)name
                        unit:(NSString *)unit
                     borders:(NSDictionary *)borders
                        data:(NSArray *)data
{
    self = [super init];
    if (self) {
        _name = name;
        _unit = unit;
        _borderValues = borders;
        _data = data;
    }
    return self;
}

+ (MonitoringDataContainer *)containerWithName:(NSString *)name
                                          unit:(NSString *)unit
                                       borders:(NSDictionary *)borders
                                          data:(NSArray *)data
{
    MonitoringDataContainer *container = [[MonitoringDataContainer alloc] initWithName:name unit:unit borders:borders data:data];
    return container;
}

@end
