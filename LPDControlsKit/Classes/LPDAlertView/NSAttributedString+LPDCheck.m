//
//  NSAttributedString+LPDCheck.h
//  LPDAdditions
//
//  Created by EyreFree on 2017/4/12.
//  Copyright © 2015年 LPD. All rights reserved.
//

#import "NSAttributedString+LPDCheck.h"

@implementation NSAttributedString (LPDCheck)

- (BOOL)hasAttributes {
    return [self attributesAtIndex:0 longestEffectiveRange:nil inRange:NSMakeRange(0, self.length)].count > 0;
}

@end
