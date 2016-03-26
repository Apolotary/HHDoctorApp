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
                     notes:(NSString *) notes
       notableHealthIssues:(NSDictionary *) notableHealthIssues
{
    self = [super init];
    if (self) {
        _patientID = patientID;
        _name = name;
        _age = age;
        _notes = notes;
        _notableHealthIssues = notableHealthIssues;
    }
    return self;
}


+ (Patient *)createPatientWithID:(NSNumber *) patientID
                            name:(NSString *) name
                             age:(NSNumber *) age
                           notes:(NSString *) notes
             notableHealthIssues:(NSDictionary *) notableHealthIssues
{
    Patient *returnPatient = [[Patient alloc] initWithID:patientID
                                                    name:name
                                                     age:age
                                                   notes:notes
                                     notableHealthIssues:notableHealthIssues];
    
    return returnPatient;
}

@end
