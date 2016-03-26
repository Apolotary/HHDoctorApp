//
//  Patient.h
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property (nonatomic, strong) NSNumber *patientID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic, strong) NSDictionary *notableHealthIssues;

+ (Patient *)createPatientWithID:(NSNumber *) patientID
                            name:(NSString *) name
                             age:(NSNumber *) age
                           notes:(NSString *) notes
             notableHealthIssues:(NSDictionary *) notableHealthIssues;


@end
