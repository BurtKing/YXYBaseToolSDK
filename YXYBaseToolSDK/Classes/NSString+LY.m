//
//  NSString+LY.m
//  Insurance
//
//  Created by 李勇 on 2018/4/11.
//  Copyright © 2018年 com.uqiauto. All rights reserved.
//

#import "NSString+LY.h"
#import <objc/message.h>
@implementation NSString (LY)
+(void)load{
    Method method1 = class_getInstanceMethod(self,  @selector(stringByAppendingString:));

    Method method2 = class_getInstanceMethod(self,  @selector(ly_stringAppendingString:));
    method_exchangeImplementations(method1, method2);
}
-(NSString *)ly_stringAppendingString:(NSString *)string{
    if (string == nil && self != nil) {
        NSLog(@"传入的string为空值");
        return self;
    }else if(string != nil && self == nil){
        NSLog(@"selfString为空值");
        return string;
    }else if(string == nil && self == nil){
        NSLog(@"都为空值");
        return @"";
    }else if(string != nil && self != nil){
        return [self ly_stringAppendingString:string];
    }else{
        return @"";
    }

}
+(void)attriColorWithLabel:(UILabel *)label color:(UIColor *)color atIndex:(NSInteger)index length:(NSInteger)length{

    NSMutableAttributedString * tempString = [[NSMutableAttributedString alloc] initWithString: label.text];
    [tempString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(index, length)];
    label.attributedText = tempString;
}
+(BOOL)isEmpty:(NSString*)text{
    if ([text isEqual:[NSNull null]]) {
        return YES;
    }
    else if ([text isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else if (text == nil){
        return YES;
    }
    return NO;
}

/*!
 @brief 修正浮点型精度丢失
 @param str 传入接口取到的数据
 @return 修正精度后的数据
 */
+(NSString *)reviseString:(NSString *)str
{
    //直接传入精度丢失有问题的Double类型
    double conversionValue = [str doubleValue];
    NSString *doubleString = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];

}
@end
