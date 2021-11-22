//
//  InsuranceUtils.m
//  Insurance
//
//  Created by 雷国峰 on 2017/6/12.
//  Copyright © 2017年 com.uqiauto. All rights reserved.
//

#import "BBUtils.h"
#import "CommonCrypto/CommonDigest.h"

@implementation BBUtils
//MD5加密方法
+(NSString *)md5:(NSString *)inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ]lowercaseString];
}
//比较两个数字字符串之间的大小
+(BOOL)compare:(NSString*) A oldString: (NSString*) B
{
    if ([A intValue]>[B intValue] || [A intValue]==[B intValue])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//获取当前时间
+(NSString*)getCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}



+(BOOL)isMobel:(NSString*)phoneNum
{
    NSString *MOBILE = @"^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:phoneNum];
}


+(BOOL)isHomePhone:(NSString*)phoneNum
{
    NSString *MOBILE = @"[0][0-9]{2,3}?[0-9]{7,8}";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:phoneNum];
}

+(BOOL)isContainNormalChar:(NSString *)str
{
    NSString * normalChar=[NSString stringWithFormat:@"[A-Za-z0-9_]{%ld}",str.length];
    
    NSPredicate *regextestNormalChar = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", normalChar];
    return [regextestNormalChar evaluateWithObject:str];
}

+(BOOL)isOnlyContainChineseChar:(NSString *)str{
    NSString * normalChar=[NSString stringWithFormat:@"[\u4e00-\u9fa5]{%ld}",str.length];
    
    NSPredicate *regextestNormalChar = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", normalChar];
    return [regextestNormalChar evaluateWithObject:str];
}




+ (NSString *)judjeNullStr:(id)str{
    if ([str isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return str ? str : @"";
}


+ (NSInteger)compareDate:(NSString*)aDate withDate:(NSString*)bDate{
    NSInteger aa;
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd"];
    NSDate *dta;
    NSDate *dtb;
    
    dta = [dateformater dateFromString:aDate];
    dtb = [dateformater dateFromString:bDate];
    NSComparisonResult result = [dta compare:dtb];
    if (result == NSOrderedSame){
        //        相等
        aa = 0;
    }else if (result == NSOrderedAscending){
        //bDate比aDate大
        aa = 1;
    }else {
        //bDate比aDate小
        aa = -1;
    }
    return aa;
}


+(UIViewController *)getCurrentVC {
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1){
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}



+ (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height {
    
    CGRect r = CGRectMake(0.0f, 0.0f, 1.0f, height);
    
    UIGraphicsBeginImageContext(r.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
    
}


/// 添加四边阴影效果
+ (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor {
    // 阴影颜色
    //    theView.layer.shadowColor = theColor.CGColor;
    //    // 阴影偏移，默认(0, -3)
    //    theView.layer.shadowOffset = CGSizeMake(0,0);
    //    // 阴影透明度，默认0
    //    theView.layer.shadowOpacity = 0.2;
    //    // 阴影半径，默认3
    //    theView.layer.shadowRadius = 5;

    theView.backgroundColor = HexRGB(0xffffff);
    //v.layer.masksToBounds=YES;这行去掉
    theView.layer.cornerRadius = 3;
    theView.layer.shadowColor = theColor.CGColor;
    theView.layer.shadowOffset = CGSizeMake(1, 3);
    theView.layer.shadowOpacity = 0.2;
    theView.layer.shadowRadius = 5;

}

+ (NSMutableArray *)getTimeAfterNowWithType:(NSInteger)type
{
    NSMutableArray *arr = [NSMutableArray array];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    NSDate *todayBegin = [calendar dateFromComponents:components];
    [components setDay:([components day]+1)];
    NSDate *todayEnd = [calendar dateFromComponents:components];
    [components setDay:([components day]+1)];
    NSDate *tomorrowEnd = [calendar dateFromComponents:components];
    [components setDay:([components day]+1)];
    NSDate *threedayEnd = [calendar dateFromComponents:components];
    [components setDay:([components day]+4)];
    NSDate *sevendayEnd = [calendar dateFromComponents:components];
    if (type == 0) {
        [arr addObject:[NSString stringWithFormat:@"%ld",(long)[todayBegin timeIntervalSince1970]]];
        [arr addObject:[NSString stringWithFormat:@"%ld",(long)[todayEnd timeIntervalSince1970]-1]];
    }else if (type == 1){
        [arr addObject:[NSString stringWithFormat:@"%ld",(long)[todayEnd timeIntervalSince1970]]];
        [arr addObject:[NSString stringWithFormat:@"%ld",(long)[tomorrowEnd timeIntervalSince1970]-1]];
    }
    else if (type == 2){
        [arr addObject:[NSString stringWithFormat:@"%ld",(long)[todayBegin timeIntervalSince1970]]];
        [arr addObject:[NSString stringWithFormat:@"%ld",(long)[threedayEnd timeIntervalSince1970]-1]];
    }else if (type == 3){
        [arr addObject:[NSString stringWithFormat:@"%ld",(long)[todayBegin timeIntervalSince1970]]];
        [arr addObject:[NSString stringWithFormat:@"%ld",(long)[sevendayEnd timeIntervalSince1970]-1]];
    }

    return arr;
}


+ (NSString *)getStrTimeWithTimeInterval:(NSString *)interval{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval.integerValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,182,183,184,187,188
     * 联通：130,131,132,145,152,155,156,185,186
     * 电信：133,1349,153,180,181,189
     */
    NSString * MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[036-8]|8[0-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,182,183,184,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|47|5[017-9]|78|8[23478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|45|5[256]|76|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|7[07]|8[019])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";

    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];

    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

// 密码校验
+ (BOOL)isPassWord:(NSString *)str{
    NSString *retxtpwd = @"^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*).{8}$";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",retxtpwd];
    return [pwdTest evaluateWithObject:str];
}

// 账号校验
+ (BOOL)isAcount:(NSString *)str{
    NSString *retxtpwd = @"^[a-zA-Z0-9]{5,10}@[a-zA-Z0-9]{5,10}$";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",retxtpwd];
    return [pwdTest evaluateWithObject:str];
}

// 清空userdefoult
+ (void)deleteUserdeFoult{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [kUserDefaults synchronize];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, Height_NavBar);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return image;
}

+ (BOOL)isOnlyContainNumer_letter_chiness:(NSString *)str{
    NSString *pattern = @"^[0-9a-zA-Z\u4e00-\u9fa5]{1,10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}

#pragma mark - 生产成二维码
+ (UIImage *)createCode:(NSString *)url andWidth:(CGFloat)width{
    // 1.创建滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    // 2.还原滤镜默认属性
    [filter setDefaults];

    // 3.设置需要生成二维码的数据到滤镜中
    // OC中要求设置的是一个二进制数据
    NSData *data = [url dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"InputMessage"];

    // 4.从滤镜从取出生成好的二维码图片
    CIImage *ciImage = [filter outputImage];

    return [self createNonInterpolatedUIImageFormCIImage:ciImage size: kScreenWidthScal(width)];

}
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)ciImage size:(CGFloat)widthAndHeight
{
    CGRect extentRect = CGRectIntegral(ciImage.extent);
    CGFloat scale = MIN(widthAndHeight / CGRectGetWidth(extentRect), widthAndHeight / CGRectGetHeight(extentRect));

    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extentRect) * scale;
    size_t height = CGRectGetHeight(extentRect) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);

    CIContext *context = [CIContext contextWithOptions:nil];

    CGImageRef bitmapImage = [context createCGImage:ciImage fromRect:extentRect];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extentRect, bitmapImage);

    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);

    return [UIImage imageWithCGImage:scaledImage]; // 黑白图片
}

@end
