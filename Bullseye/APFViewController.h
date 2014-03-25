//
//  APFViewController.h
//  Bullseye
//
//  Created by Flack AP on 3/24/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APFViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;

-(IBAction)showAlert;

- (IBAction)sliderMoved:(UISlider *)slider;

@end


