//
//  LPDViewController.m
//  LPDControlsKit
//
//  Created by foxsofter on 12/02/2016.
//  Copyright (c) 2016 foxsofter. All rights reserved.
//

#import "LPDViewController.h"
#import "LPDAlertView.h"

@interface LPDViewController ()

@end

@implementation LPDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIButton *testButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [testButton setTitle: @"Click Me" forState: UIControlStateNormal];
    [testButton addTarget: self action: @selector(testClicked:) forControlEvents: UIControlEventTouchUpInside];
    [testButton sizeToFit];
    testButton.center = self.view.center;
    [self.view addSubview: testButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testClicked:(UIButton *)button {
    [LPDAlertView show:@"Test" title:@"TestTitle" action:^{
        NSLog(@"Test Clicked");
    }];
}

@end
