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
    int _score;
    int _round;
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
    int points = 100 - difference;
    NSString *title;
    _score += points;
    
    if (points == 100) {
        title = @"Bull's Eye!";
    } else{
        title = @"Try again!";
    }
    
    NSString *message = [NSString stringWithFormat:
                         @"The value of the slider is: %d\nThe target value is: %d\nThe difference is: %d\nYou have scored %d points",
                         _currentValue, _targetValue, difference, points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
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
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = self.slider.value;
    self.slider.value = _currentValue;
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",
                             _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",
                            _score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",
                            _round];
}

//method to check the slider's value and round it to closest integer
- (IBAction)sliderMoved:(UISlider *)slider {
    
        _currentValue = lroundf(slider.value);
}

@end
