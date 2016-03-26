//
//  PatientDataManager.m
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import "PatientDataManager.h"

@implementation PatientDataManager

+ (id)sharedManager
{
    static PatientDataManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)getPatientForID:(NSNumber *)patientID
{
    // Dummy data code for now
    
    Patient *returnPatient = [Patient createPatientWithID:[NSNumber numberWithInt:123] name:@"Suzuki Taro" age:@23 notes:@"Specific notes here" notableHealthIssues:@{@"diabetes" : @NO, @"hypertension" : @YES, @"asthma" : @NO}];
    _mainPatient = returnPatient;
}


@end
