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

    [self newGame];
    [self updateLabels];
    
    
    UIImage *thumbImageNormal = [UIImage
                                 imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal
                      forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage
                                      imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted
                      forState:UIControlStateHighlighted];
    UIImage *trackLeftImage =
    [[UIImage imageNamed:@"SliderTrackLeft"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMinimumTrackImage:trackLeftImage
                             forState:UIControlStateNormal];
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage
                             forState:UIControlStateNormal];
}

//hides status bar
- (BOOL)prefersStatusBarHidden
{
    return YES;
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
    if (difference == 0) {
        title = @"Bull's Eye!";
        points += 100;
    } else if (difference < 5) {
        title = @"You almost had it!";
        if (difference == 1) {
            points += 40;
        }
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Try again!";
    };
    
    _score += points;
    
    NSString *message = [NSString stringWithFormat:
                         @"The value of the slider is: %d\nThe target value is: %d\nThe difference is: %d\nYou have scored %d points",
                         _currentValue, _targetValue, difference, points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
    
}

//method to create a new round- to be performed when user clicks "click me!"
- (void)newRound
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

//method that starts a new round and updates labels when alert is closed
- (void)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self newRound];
    [self updateLabels];
}

-(void)restart {
    [self newGame];
    [self updateLabels];
}

//resets values for score and round
- (void)newGame
{
    _score = 0;
    _round = 0;
    [self newRound];
}

@end
