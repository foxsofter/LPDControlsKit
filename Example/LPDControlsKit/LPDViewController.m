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
    /*[LPDAlertView show:@"Test" title:@"TestTitle" action:^{
     NSLog(@"Test Clicked");
     }];*/
}

- (void)testClicked2:(UIButton *)button {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题"
                                                                             message:@"这个是LPDAlertController的默认样式啦啦啦这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
