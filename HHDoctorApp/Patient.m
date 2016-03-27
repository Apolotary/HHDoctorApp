//
//  Patient.m
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import "Patient.h"
#import "MonitoringDataContainer.h"

@implementation Patient

- (instancetype)initWithID:(NSNumber *) patientID
                      name:(NSString *) name
                       age:(NSNumber *) age
                    isMale:(NSNumber *) isMale
                     notes:(NSString *) notes
       notableHealthIssues:(NSDictionary *) notableHealthIssues
{
    self = [super init];
    if (self) {
        _patientID = patientID;
        _name = name;
        _age = age;
        _notes = notes;
        _isMale = isMale;
        _notableHealthIssues = notableHealthIssues;
    }
    return self;
}


+ (Patient *)createPatientWithID:(NSNumber *) patientID
                            name:(NSString *) name
                             age:(NSNumber *) age
                             isMale:(NSNumber *) isMale
                           notes:(NSString *) notes
             notableHealthIssues:(NSDictionary *) notableHealthIssues
{
    Patient *returnPatient = [[Patient alloc] initWithID:patientID
                                                    name:name
                                                     age:age
                                                  isMale:isMale
                                                   notes:notes
                                     notableHealthIssues:notableHealthIssues];
    
    return returnPatient;
}

- (NSString *) getFormattedStringForHealth
{
    // @{@"diabetes" : @NO, @"hypertension" : @YES, @"asthma" : @NO}
    
    NSMutableString *resultString = [[NSMutableString alloc] init];
    
    if ([_notableHealthIssues[@"diabetes"] boolValue])
    {
        [resultString appendString:@"* Diabetes \n"];
    }
    
    if ([_notableHealthIssues[@"hypertension"] boolValue])
    {
        [resultString appendString:@"* Hypertension \n"];
    }
    
    if ([_notableHealthIssues[@"asthma"] boolValue])
    {
        [resultString appendString:@"* Asthma \n"];
    }
    
    return [[NSString alloc] initWithString:resultString];
}

- (void)createMonitoringData
{
    MonitoringDataContainer *bloodSugarLevels = [MonitoringDataContainer containerWithName:@"Blood Sugar" unit:@"mg/dl" borders:@{@"low":@0, @"high": @200} data:@[@70, @100, @110, @80, @90, @120, @95, @105]];
    MonitoringDataContainer *sleepTimeLevels = [MonitoringDataContainer containerWithName:@"Sleep Time" unit:@"hrs" borders:@{@"low" : @0, @"high": @24} data:@[@3, @5, @8, @7, @4, @5, @6]];
    MonitoringDataContainer *caloricIntakeLevels = [MonitoringDataContainer containerWithName:@"Caloric Intake" unit:@"kcal" borders:@{@"low" : @0, @"high": @5000} data:@[@1800, @2000, @1500, @3000, @4000, @2000, @1200]];
    MonitoringDataContainer *stepsMade = [MonitoringDataContainer containerWithName:@"Steps Made" unit:@"steps" borders:@{@"low" : @0, @"high": @30000} data:@[@2000, @8000, @5000, @20000, @10000, @4000, @8000]];
    MonitoringDataContainer *heartRate = [MonitoringDataContainer containerWithName:@"Heart Rate" unit:@"bpm" borders:@{@"low" : @60, @"high": @250} data:@[@90, @90, @120, @90, @110, @90, @120]];
    MonitoringDataContainer *hoursWorking = [MonitoringDataContainer containerWithName:@"Working hours" unit:@"hrs" borders:@{@"low" : @0, @"high": @24} data:@[@8, @5, @10, @6, @8, @4, @2]];
    
    _monitoringData = @[bloodSugarLevels, sleepTimeLevels, caloricIntakeLevels, stepsMade, heartRate, hoursWorking];
}

@end
