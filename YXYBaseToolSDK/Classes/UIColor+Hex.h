//
//  UIColor+Hex.h
//  优汽配送
//
//  Created by mac on 15/12/5.
//  Copyright © 2015年 com.uqiauto.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *) colorWithHexString: (NSString *) hexString;
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length Case:(int) ARGB;
@end
