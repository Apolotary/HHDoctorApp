//
//  BarCodeScanViewController.h
//  HHDoctorApp
//
//  Created by Bektur Ryskeldiev on 3/27/16.
//  Copyright © 2016 Bektur Ryskeldiev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BarCodeScanProtocol <NSObject>

- (void)scanCompleteWithResult:(BOOL)success;

@end

@interface BarCodeScanViewController : UIViewController

@property (nonatomic, weak) id<BarCodeScanProtocol> delegate;

@end
