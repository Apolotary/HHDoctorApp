//
//  Patient.m
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import "Patient.h"

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

@end
