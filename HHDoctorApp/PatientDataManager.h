//
//  PatientDataManager.h
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface PatientDataManager : NSObject

+ (id)sharedManager;

- (Patient *)getPatientForID:(NSNumber *)patientID;


@end
