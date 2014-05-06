//
//  DHViewController.h
//  PasswordMotion
//
//  Created by BinaryBoy on 5/5/14.
//  Copyright (c) 2014 BinaryBoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreMotion/CoreMotion.h"
@interface DHViewController : UIViewController{
    CMMotionManager*mm;
}
@property (weak, nonatomic) IBOutlet UITextField *txtX;
@property (weak, nonatomic) IBOutlet UITextField *txtY;
@property (weak, nonatomic) IBOutlet UITextField *txtZ;
- (IBAction)checkPassword:(id)sender;
- (IBAction)stopAcc:(id)sender;

- (IBAction)savePassword:(id)sender;
@end
