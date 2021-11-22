//
//  InsuranceUtils.h
//  Insurance
//
//  Created by 雷国峰 on 2017/6/12.
//  Copyright © 2017年 com.uqiauto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXYHeader.h"
#import <UIKit/UIKit.h>
typedef void (^requestSubmitSuccessBlock)(void);
@interface BBUtils : NSObject
//获取当前时间
+(NSString*)getCurrentTime;
//MD5加密方法
+(NSString *)md5:(NSString *)inPutText;
//比较两个数字字符串的大小
+(BOOL)compare:(NSString*) A oldString: (NSString*) B;//比较两个字符串大小

// 账号校验
+ (BOOL)isAcount:(NSString *)str;
// 密码校验
+ (BOOL)isPassWord:(NSString *)str;
/**
 判断是否是手机号

 @param phoneNum 传入手机号
 @return YES是
 */
+(BOOL)isMobel:(NSString*)phoneNum;


/**
 判断是否是座机

 @param phoneNum 传入座机号
 @return Yes是
 */
+(BOOL)isHomePhone:(NSString*)phoneNum;



/**
 判断只包含字母数字下划线

 @param str 传入的字符串
 @return YES是
 */
+(BOOL)isContainNormalChar:(NSString*)str;



+ (NSString *)judjeNullStr:(id)str;


/**
 判断只包含汉字

 @param str str
 @return BOOL
 */
+(BOOL)isOnlyContainChineseChar:(NSString *)str;


/**
 日期string比较

 @param aDate a
 @param bDate b
 @return aa
 */
+ (NSInteger)compareDate:(NSString*)aDate withDate:(NSString*)bDate;


+(UIViewController *)getCurrentVC;


+ (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height;

// 给 view加阴影
/// 添加四边阴影效果
+ (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor;
// 获取零点时间段
+ (NSMutableArray *)getTimeAfterNowWithType:(NSInteger)type;
;
// 根据时间戳返回时间
+ (NSString *)getStrTimeWithTimeInterval:(NSString *)interval;
// 手机号验证
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
// 清空userdefoult
+ (void)deleteUserdeFoult;
// 绘制相册导航栏颜色
+ (UIImage *)imageWithColor:(UIColor *)color;
// 只能包好数字、字母、汉字
+ (BOOL)isOnlyContainNumer_letter_chiness:(NSString *)str;
#pragma mark - 生产成二维码
+ (UIImage *)createCode:(NSString *)url andWidth:(CGFloat)width;
@end
