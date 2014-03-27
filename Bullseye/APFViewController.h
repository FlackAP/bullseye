//
//  APFViewController.h
//  Bullseye
//
//  Created by Flack AP on 3/24/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import <UIKit/UIKit.h>

//BullsEyeViewController listens to the UIAlertView as a delegate
@interface APFViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

-(IBAction)showAlert;

-(IBAction)restart;

- (IBAction)sliderMoved:(UISlider *)slider;

@end


