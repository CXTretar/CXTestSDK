//
//  CXViewController.m
//  CXTestSDK
//
//  Created by CXTretar on 03/13/2020.
//  Copyright (c) 2020 CXTretar. All rights reserved.
//

#import "CXViewController.h"
#import <CXTestSDK/FPM_ApiManager.h>

@interface CXViewController ()

@end

@implementation CXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [FPM_ApiManager show];
}


@end
