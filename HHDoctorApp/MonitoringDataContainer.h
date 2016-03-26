//
//  MonitoringDataContainer.h
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import <Foundation/Foundation.h>

// Every parameter goes as
// Name
// Unit
// Borders - max/min
// Data

@interface MonitoringDataContainer : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSDictionary *borderValues;
@property (nonatomic, strong) NSArray *data;

- (instancetype)initWithName:(NSString *)name
                        unit:(NSString *)unit
                     borders:(NSDictionary *)borders
                        data:(NSArray *)data;

+ (MonitoringDataContainer *)containerWithName:(NSString *)name
                                          unit:(NSString *)unit
                                       borders:(NSDictionary *)borders
                                          data:(NSArray *)data;

@end
