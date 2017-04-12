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
    [testButton setTitle: @"LPDAlertController" forState: UIControlStateNormal];
    [testButton addTarget: self action: @selector(testClicked:) forControlEvents: UIControlEventTouchUpInside];
    [testButton sizeToFit];
    testButton.center = self.view.center;
    [self.view addSubview: testButton];

    UIButton *testButton2 = [UIButton buttonWithType: UIButtonTypeSystem];
    [testButton2 setTitle: @"UIAlertController" forState: UIControlStateNormal];
    [testButton2 addTarget: self action: @selector(testClicked2:) forControlEvents: UIControlEventTouchUpInside];
    [testButton2 sizeToFit];
    testButton2.center = CGPointMake(self.view.center.x, self.view.center.y + 36);
    [self.view addSubview: testButton2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testClicked:(UIButton *)button {
    LPDAlertAction *action = [[LPDAlertAction alloc] init];
    action.title = @"Action";
    action.action = ^{
        NSLog(@"Test Clicked");
    };

    [LPDAlertView show:@"Test"
               message:@"Message"
                action:action];
}

- (void)testClicked2:(UIButton *)button {
    LPDAlertAction *action = [[LPDAlertAction alloc] init];
    action.title = @"Action";
    action.action = ^{
        NSLog(@"Test Clicked Attributed");
    };

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"MessageAttributed"];
    [attributedString setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldItalicMT" size:18],      // 字体、字号
                                      NSForegroundColorAttributeName:[UIColor blueColor],
                                      NSBackgroundColorAttributeName:[UIColor brownColor]}
                              range:NSMakeRange(0, 10)];

    [LPDAlertView show:@"TestAttributed"
     attributedMessage:attributedString
                action:action];
}

@end
