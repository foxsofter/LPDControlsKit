//
//  LPDAlertController.h
//  Pods
//
//  Created by EyreFree on 2017/4/4.
//
//

#import <Foundation/Foundation.h>

@interface LPDAlertController : UIAlertController

//  target: UIViewController
//   title: String
// message: String
// NSArray: [UIAlertAction]
+ (void)show:(UIViewController *)target title:(NSString *)title message:(NSString *)message action:(NSArray*)actions;

@end
