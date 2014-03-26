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
    int _targetValue;
}

//when view loads, set current value and add a pseudo-random number between 1 and 100 based on startNewRound method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert {
    int difference = abs(_targetValue - _currentValue);

    NSString *message = [NSString stringWithFormat:
                         @"The value of the slider is: %d\nThe target value is: %d\nThe difference is: %d",
                         _currentValue, _targetValue, difference];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Hello, World!"
                              message:message
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
    
    
    //starts a new round after alert is shown
    [self startNewRound];
    [self updateLabels];
    
}

//method to create a new round- to be performed when user clicks "click me!"
- (void)startNewRound
{
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = self.slider.value;
    self.slider.value = _currentValue;
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",
                             _targetValue];
}

//method to check the slider's value and round it to closest integer
- (IBAction)sliderMoved:(UISlider *)slider {
    
        _currentValue = lroundf(slider.value);
}

@end
