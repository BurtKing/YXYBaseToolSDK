//
//  NSString+LY.h
//  Insurance
//
//  Created by 李勇 on 2018/4/11.
//  Copyright © 2018年 com.uqiauto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LY)
+(void)attriColorWithLabel:(UILabel *)label color:(UIColor *)color atIndex:(NSInteger)index length:(NSInteger)length;
+(BOOL)isEmpty:(NSString*)text;
+(NSString *)reviseString:(NSString *)str;
@end
