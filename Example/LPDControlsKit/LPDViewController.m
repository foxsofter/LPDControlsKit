//
//  LPDViewController.m
//  LPDControlsKit
//
//  Created by foxsofter on 12/02/2016.
//  Copyright (c) 2016 foxsofter. All rights reserved.
//

#import "LPDViewController.h"
#import "LPDAlertView.h"
#import "LPDSystemAlertView.h"

@interface LPDViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, readonly) NSArray *sampleTitles;

@end

@implementation LPDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _sampleTitles = @[@"LPDAlertViewNormal",
                      @"UIAlertController",
                      @"LPDAlertViewSystem无标题",
                      @"LPDAlertViewSystem单行",
                      @"LPDAlertViewSystem多行"];

    [self setTableView];
}

- (void)setTableView {
    if (!_tableView) {
        CGRect frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
}

#pragma mark tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sampleTitles.count;
}

#pragma mark tableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"SAMPLE"];
    cell.textLabel.text = _sampleTitles[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSelector:NSSelectorFromString(_sampleTitles[indexPath.row])];
}

- (void)LPDAlertViewNormal {
    LPDAlertAction *action = [[LPDAlertAction alloc] init];
    action.title = @"Action";
    action.action = ^{
        NSLog(@"Test Clicked: Action");
    };

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"MessageAttributedMessageAttributedMessageAttributedMessageAttributedMessageAttributedMessageAttributedMessageAttributedMessageAttributedMessageAttributedMessageAttributed"];
    [attributedString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:30],      // 字体、字号
                                      NSForegroundColorAttributeName:[UIColor blueColor],
                                      NSBackgroundColorAttributeName:[UIColor brownColor]}
                              range:NSMakeRange(0, 10)];

    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} range:NSMakeRange(6, 6)];

    [LPDAlertView show:@"TestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributedTestAttributed"
     attributedMessage:attributedString
                action:action];
}

- (void)UIAlertController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"
                                                                             message:@"这个是LPDAlertController的默认样式啦啦啦这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)LPDAlertViewSystem无标题 {
    LPDAlertAction *actionOK = [[LPDAlertAction alloc] init];
    actionOK.title = @"好的";
    actionOK.action = ^{
        NSLog(@"Test Clicked: 好的");
    };
    LPDAlertAction *actionCancel = [[LPDAlertAction alloc] init];
    actionCancel.title = @"取消";
    actionCancel.action = ^{
        NSLog(@"Test Clicked: 取消");
    };
    [LPDSystemAlertView show:@"默认样式"
                     action1:actionCancel
                     action2:actionOK];
}

- (void)LPDAlertViewSystem单行 {
    LPDAlertAction *actionOK = [[LPDAlertAction alloc] init];
    actionOK.title = @"好的";
    actionOK.action = ^{
        NSLog(@"Test Clicked: 好的");
    };
    LPDAlertAction *actionCancel = [[LPDAlertAction alloc] init];
    actionCancel.title = @"取消";
    actionCancel.action = ^{
        NSLog(@"Test Clicked: 取消");
    };
    [LPDSystemAlertView show:@"标题标题"
                     message:@"默认样式"
                     action1:actionCancel
                     action2:actionOK];
}

- (void)LPDAlertViewSystem多行 {
    LPDAlertAction *actionOK = [[LPDAlertAction alloc] init];
    actionOK.title = @"好的";
    actionOK.action = ^{
        NSLog(@"Test Clicked: 好的");
    };
    LPDAlertAction *actionCancel = [[LPDAlertAction alloc] init];
    actionCancel.title = @"取消";
    actionCancel.action = ^{
        NSLog(@"Test Clicked: 取消");
    };
    LPDAlertAction *actionUnknown = [[LPDAlertAction alloc] init];
    actionUnknown.title = @"未知";
    actionUnknown.action = ^{
        NSLog(@"Test Clicked: 未知");
    };
    [LPDSystemAlertView show:@"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"
                     message:@"这个是LPDAlertController的默认样式啦啦啦这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式这个是LPDAlertController的默认样式"
                     action1:actionCancel
                     action2:actionOK];
}

@end
