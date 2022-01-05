//
//  UIColor+Hex.h
//  BBTransproter
//
//  Created by 李勇 on 2019/3/18.
//  Copyright © 2019年 BB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)colorWithHex:(NSInteger)hexValue;

+ (UIColor*)randomColor;
+ (UIColor *) colorWithHexString: (NSString *) hexString;
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length Case:(int) ARGB;
@end


@interface NSString (NSString_URLEncode)
- (NSString *)urlencode;
@end

NS_ASSUME_NONNULL_END
