//
//  DHViewController.m
//  PasswordMotion
//
//  Created by BinaryBoy on 5/5/14.
//  Copyright (c) 2014 BinaryBoy. All rights reserved.
//

#import "DHViewController.h"
#import "PDKeychainBindings.h"
@interface DHViewController ()

@end

@implementation DHViewController
@synthesize txtX,txtY,txtZ;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    mm=[[CMMotionManager alloc]init];
    if (mm.isDeviceMotionAvailable) {
        mm.deviceMotionUpdateInterval=1.0/60.0;
        [mm startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
            
//            CMAttitude*currentAttitude=motion.attitude;
//            float roll=currentAttitude.roll;
//            float pitch=currentAttitude.pitch;
//            float yaw=currentAttitude.yaw;
            
            
            
            CMAcceleration currentAcceleration=motion.userAcceleration;
          txtX.text=  [NSString stringWithFormat:@"%.2f",currentAcceleration.x];
          txtY.text=  [NSString stringWithFormat:@"%.2f",currentAcceleration.y];
          txtZ.text=  [NSString stringWithFormat:@"%.2f",currentAcceleration.z];

            
        
            
            
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkPassword:(id)sender {
    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    //[bindings objectForKey:@if"X"];
    BOOL boolX= NO,boolY= NO,boolZ = NO;
    if ([txtX.text isEqualToString:[[bindings objectForKey:@"X"] stringValue]]) {
        boolX=YES;
    }
    if ([txtX.text isEqualToString:[[bindings objectForKey:@"X"] stringValue]]) {
        boolY=YES;

    }
    if ([txtX.text isEqualToString:[[bindings objectForKey:@"X"] stringValue]]) {
        boolZ=YES;

    }

    if (boolX&&boolY&&boolZ) {
        [[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Correct" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show];
    }
  }

- (IBAction)stopAcc:(id)sender {
    [[NSOperationQueue currentQueue] cancelAllOperations];
}

- (IBAction)savePassword:(id)sender {
    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    [bindings setObject:txtX.text forKey:@"X"];
    
    [bindings setObject:txtY.text forKey:@"Y"];
    
    [bindings setObject:txtZ.text forKey:@"Z"];

}
@end
