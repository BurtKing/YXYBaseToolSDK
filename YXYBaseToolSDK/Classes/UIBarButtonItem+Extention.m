//
//  UIBarButtonItem+Extention.m
//  Insurance
//
//  Created by 李勇 on 2018/4/13.
//  Copyright © 2018年 com.uqiauto. All rights reserved.
//

#import "UIBarButtonItem+Extention.h"

@implementation UIBarButtonItem (Extention)
+(UIBarButtonItem *)barButtonItemWithImage:(NSString *)barButtonImage target:(id)target selector:(SEL)selctor{
    UIButton *btn = [[UIButton alloc]init];
    [btn  addTarget:target action:selctor forControlEvents:UIControlEventTouchUpInside];

    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImage *btnImage = [UIImage imageNamed:barButtonImage];
    btn.frame = CGRectMake(0, 0, btnImage.size.width * 2, btnImage.size.height * 2);
    [btn setImage:btnImage forState:UIControlStateNormal];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return buttonItem;
}
+(UIBarButtonItem *)barButtonItemWithImage:(NSString *)barButtonImage target:(id)target selector:(SEL)selctor horizontalAlignment:(UIControlContentHorizontalAlignment )horizontalAlignment{
    UIButton *btn = [[UIButton alloc]init];
    [btn  addTarget:target action:selctor forControlEvents:UIControlEventTouchUpInside];

    btn.contentHorizontalAlignment = horizontalAlignment;
    UIImage *btnImage = [UIImage imageNamed:barButtonImage];
    btn.frame = CGRectMake(0, 0, btnImage.size.width * 2, btnImage.size.height * 2);
    [btn setImage:btnImage forState:UIControlStateNormal];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return buttonItem;
}
+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font target:(id)target selector:(SEL)selctor {
    UIButton *btn = [[UIButton alloc]init];
    [btn addTarget:target action:selctor forControlEvents:UIControlEventTouchUpInside];
    [btn setContentMode:UIViewContentModeCenter];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.frame = CGRectMake(0, 0, [title sizeWithAttributes:@{NSFontAttributeName:font}].width, [title sizeWithAttributes:@{NSFontAttributeName:font}].height);
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return btnItem;
}
@end
