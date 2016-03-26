//
//  SummaryViewController.m
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import "SummaryViewController.h"
#import "PatientDataManager.h"
#import "BarCodeScanViewController.h"

@interface SummaryViewController () <BarCodeScanProtocol>
{
    IBOutlet UILabel *_labelName;
    IBOutlet UILabel *_labelAge;
    IBOutlet UILabel *_labelSex;
    IBOutlet UITextView *_textViewNotes;
    IBOutlet UITextView *_textViewHealth;
}

@end

@implementation SummaryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![[PatientDataManager sharedManager] mainPatient])
    {
        [self performSelector:@selector(showBarCodeScanVC) withObject:nil afterDelay:0.0];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowBarCodeScanVC"])
    {
        BarCodeScanViewController *barCodeScanVC = (BarCodeScanViewController *)segue.destinationViewController;
        barCodeScanVC.delegate = self;
    }
}

#pragma mark - Bar Code scan segue

- (void)showBarCodeScanVC
{
    [self performSegueWithIdentifier:@"ShowBarCodeScanVC" sender:self];
}

#pragma mark - Outputting patient data

- (void)outputPatientData
{
    Patient *patient =[[PatientDataManager sharedManager] mainPatient];
    
    [_labelName setText:patient.name];
    [_labelAge setText:[NSString stringWithFormat:@"%@", patient.age]];
    [_labelSex setText:[NSString stringWithFormat:@"%@", patient.isMale ? @"Male" : @"Female"]];
    [_textViewNotes setText:patient.notes];
    [_textViewHealth setText:patient.getFormattedStringForHealth];
}

#pragma mark - BarCodeScanVC protocol

- (void)scanCompleteWithResult:(BOOL)success
{
    if (success)
    {
        [self outputPatientData];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
