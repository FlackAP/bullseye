//
//  APFViewController.m
//  Bullseye
//
//  Created by Flack AP on 3/24/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import "APFViewController.h"

@interface APFViewController ()

@end

@implementation APFViewController {
    int _currentValue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_currentValue = 50;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert {
    NSString *message = [NSString stringWithFormat:
                         @"The value of the slider is: %d", _currentValue];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Hello, World!"
                              message:message
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
    
}

- (IBAction)sliderMoved:(UISlider *)slider {
    
        _currentValue = lroundf(slider.value);
}

@end
