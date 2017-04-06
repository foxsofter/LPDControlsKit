//
//  LPDAlertController.m
//  Pods
//
//  Created by EyreFree on 2017/4/4.
//
//

#import "LPDAlertController.h"
#import "UIColor+LPDAddition.h"

#define LPDAlertControllerTitleLabelTag 2222
#define LPDAlertControllerMessageLabelTag 2333
#define LPDAlertControllerActionLabelTag 4555

// LPDAlertController
@implementation LPDAlertController

+ (void)show:(UIViewController *)target title:(NSString *)title message:(NSString *)message action:(NSArray*)actions {
    // 构建一个普通的 LPDAlertController 并弹起
    LPDAlertController *alertController = [LPDAlertController alertControllerWithTitle:title
                                                                               message:message
                                                                        preferredStyle:UIAlertControllerStyleAlert];
    for (id action in actions) {
        UIAlertAction *alertAction = (UIAlertAction *)action;
        if (alertAction.style == UIAlertActionStyleCancel) {
            [alertAction setValue:[UIColor colorWithHexString:@"#666666"] forKey:@"titleTextColor"];
        } else {
            [alertAction setValue:[UIColor colorWithHexString:@"#008AF1"] forKey:@"titleTextColor"];
        }
        [alertController addAction:alertAction];
    }
    [target presentViewController:alertController animated:YES completion:nil];
}

//观察者需要实现的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UIFont *myActionLabelFont = [UIFont systemFontOfSize:16];
    UIFont *newFont = [change objectForKey:NSKeyValueChangeNewKey];

    if (newFont.pointSize != myActionLabelFont.pointSize || newFont.fontName != myActionLabelFont.fontName) {
        [((UILabel *)object) setFont:myActionLabelFont];
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];

    // 查找 title 和 message 所在 UILabel
    // http://blog.csdn.net/tcm455090672/article/details/51512577
    UIView *subView1 = self.view.subviews[0];
    UIView *subView2 = subView1.subviews[0];
    UIView *subView3 = subView2.subviews[0];
    UIView *subView4 = subView3.subviews[0];
    UIView *subView5 = subView4.subviews[0];
    // 取 Title Label 改样式并做标记
    UILabel *title = subView5.subviews[0];
    title.textColor = [UIColor colorWithHexString:@"#333333"];
    title.font = [UIFont systemFontOfSize:17];
    title.tag = LPDAlertControllerTitleLabelTag;
    // 取 Message Label 改样式并做标记
    UILabel *message = subView5.subviews[1];
    message.textColor = [UIColor colorWithHexString:@"#333333"];
    message.font = [UIFont systemFontOfSize:13];
    message.tag = LPDAlertControllerMessageLabelTag;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // 强制 AutoLayout 刷新 Message 尺寸
    UILabel *message = (UILabel *)[self getView:self.view with:LPDAlertControllerMessageLabelTag];
    [message layoutIfNeeded];

    // 为 Action Label 修改字体
    NSArray *actionViews = [self getActionLabels:self.view];
    for (id actionView in actionViews) {
        [(UILabel *)actionView setFont:[UIFont systemFontOfSize:16]];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // 为 Action Label 添加观察者
    NSArray *actionViews = [self getActionLabels:self.view];
    for (id actionView in actionViews) {
        [(UILabel *)actionView addObserver:self
                                forKeyPath:@"font"
                                   options:NSKeyValueObservingOptionNew
                                   context:@"this is a context"];
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    // 为 Action Label 移除观察者
    NSArray *actionViews = [self getActionLabels:self.view];
    for (id actionView in actionViews) {
        [(UILabel *)actionView removeObserver:self forKeyPath:@"font"];
    }
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    UILabel *message = (UILabel *)[self getView:self.view with:LPDAlertControllerMessageLabelTag];
    // NSLog(@"viewDidLayoutSubviews: %f", message.frame.size.height);
    // 如果正文是多行然后设置 Message 内容居左
    if (message.frame.size.height > 20) {
        message.textAlignment = NSTextAlignmentLeft;
    }
}

-(NSArray *)getLabels:(UIView *)view {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    if ([view isKindOfClass:[UILabel class]] == YES) {
        [result addObject:view];
    }
    for (int index = 0; index < view.subviews.count; ++index) {
        NSArray *tempArray = [self getLabels:view.subviews[index]];
        if (0 < tempArray.count) {
            [result addObjectsFromArray:tempArray];
        }
    }
    return result;
}

-(NSArray *)getActionLabels:(UIView *)view {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSArray *labels = [self getLabels:view];
    for (id label in labels) {
        UILabel *tempLabel = label;
        if (tempLabel.tag != LPDAlertControllerMessageLabelTag && tempLabel.tag != LPDAlertControllerTitleLabelTag) {
            [result addObject:tempLabel];
        }
    }
    return result;
}

-(UIView *)getView:(UIView *)view with:(int)tag {
    if (view.tag == tag) {
        return view;
    }
    for (int index = 0; index < view.subviews.count; ++index) {
        UIView *tempView = [self getView:view.subviews[index] with:tag];
        if (nil != tempView) {
            return tempView;
        }
    }
    return nil;
}

@end
