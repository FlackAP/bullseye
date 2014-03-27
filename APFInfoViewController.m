//
//  APFInfoViewController.m
//  Bullseye
//
//  Created by Flack AP on 3/27/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import "APFInfoViewController.h"

@interface APFInfoViewController ()

@end

@implementation APFInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close
{
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:nil];
}


@end
