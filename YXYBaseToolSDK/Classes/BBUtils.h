//
//  InsuranceUtils.h
//  Insurance
//
//  Created by 雷国峰 on 2017/6/12.
//  Copyright © 2017年 com.uqiauto. All rights reserved.
//
//test yin

#import <Foundation/Foundation.h>
#import "YXYHeader.h"
#import <UIKit/UIKit.h>
typedef void (^requestSubmitSuccessBlock)(void);
@interface BBUtils : NSObject
//MD5加密方法
+(NSString *)md5:(NSString *)inPutText;
//SH1加密方法
+(NSString *)sha1:(NSString *)input;
//获取当前时间
+(NSString*)getCurrentTime;
+(NSString *)getCurrentYMD;
+(NSString *)getCurrentHM;
//比较两个数字字符串的大小
+(BOOL)compare:(NSString*) A oldString: (NSString*) B;//比较两个字符串大小
//获取当前时间戳（秒）
+(NSString *)getNowTimeTimestamp;
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

// 判断是否是密码格式
+(BOOL)isPassWord:(NSString *)str;


+(UIViewController *)getCurrentVC;


+ (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height;

+(id)getFirstResponder;

/**
 ** lineView:      需要绘制成虚线的view
 ** lineLength:    虚线的宽度 //2
 ** lineSpacing:        虚线的间距//1
 ** lineColor:    虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

+(void)touchFeedBack;

+(NSString *)removeWhiteSpaceAndNewlineChar:(NSString *)string;

// 给 view加阴影
/// 添加四边阴影效果
+ (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor;
// 获取零点时间段
+ (NSMutableArray *)getTimeAfterNowWithType:(NSInteger)type;

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

+(BOOL)isPureFloat:(NSString *)string;
+(BOOL)isPureInt:(NSString *)string;

+(UIImage *)imageFromBase64String:(NSString *)str;

//处理URL特殊字符
+ (NSString *)turnURLChineseChar:(NSString *)str;


//判断是否大写字母
+(BOOL)onlyInputACapital:(NSString*)string;
//验证车牌正确与否
+(BOOL)checkCarID:(NSString *)carID;
//验证纳税人识别号
+ (BOOL)validateTaxpayerNumber:(NSString*)TaxpayerNumber;
//验证身份证
+(BOOL)validateIDCardNumber:(NSString *)value;
+(BOOL)judgeVIN:(NSString *)str;
@end
