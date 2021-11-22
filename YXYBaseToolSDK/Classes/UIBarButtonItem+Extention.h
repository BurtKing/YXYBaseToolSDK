//
//  UIBarButtonItem+Extention.h
//  Insurance
//
//  Created by 李勇 on 2018/4/13.
//  Copyright © 2018年 com.uqiauto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extention)

+(UIBarButtonItem *)barButtonItemWithImage:(NSString *)barButtonImage target:(id)target selector:(SEL)selctor;
+(UIBarButtonItem *)barButtonItemWithTitle:(NSString*)title titleColor:(UIColor*)color titleFont:(UIFont *)font target:(id)target selector:(SEL)selctor;
+(UIBarButtonItem *)barButtonItemWithImage:(NSString *)barButtonImage target:(id)target selector:(SEL)selctor horizontalAlignment:(UIControlContentHorizontalAlignment )horizontalAlignment;

@end
