//
//  LBViewController.m
//  ipad-waveform
//
//  Created by saifuddin on 17/10/13.
//  Copyright (c) 2013 saifuddin. All rights reserved.
//

#import "LBViewController.h"
#import "LBWaveForm.h"

@interface LBViewController ()

@end

@implementation LBViewController

- (void)viewDidLoad
{
    LBWaveForm *waveForm = [[LBWaveForm alloc] initWithFrame:CGRectMake(0, 0.3*self.view.frame.size.height, self.view.frame.size.width, 200)];
    [self.view addSubview:waveForm];
    [waveForm animateWave];

    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
