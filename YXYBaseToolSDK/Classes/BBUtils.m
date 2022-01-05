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
+(NSString *)md5:(NSString *)inPutText{
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

+(NSString *)sha1:(NSString *)input{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

//获取当前时间
+(NSString*)getCurrentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

+(NSString *)getCurrentYMD{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

+(NSString *)getCurrentHM{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

//比较两个数字字符串之间的大小
+(BOOL)compare:(NSString*) A oldString: (NSString*) B{
    if ([A intValue]>[B intValue] || [A intValue]==[B intValue]) {
        return YES;
    } else {
        return NO;
    }
}

+(NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
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


+(BOOL)isPassWord:(NSString *)str{
//    NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)(?![-~!@#\\\\$%^&*_+=|(){}\\[:;\"'<>,.?\\]\\`]+$)[0-9a-zA-Z-~!@#\\\\$%^&*_+=|(){}\\[:;\"'<>,.?\\]\\`]{8,16}$";
    NSString *regex = @"^(?![a-z]+$)(?![A-Z]+$)(?![0-9]+$)(?![\\W_]+$)(?![a-zA-Z]+$)(?![a-z0-9]+$)(?![a-z\\W_]+$)(?![A-Z0-9]+$)(?![A-Z\\W_]+$)(?![0-9\\W_]+$)[a-zA-Z0-9\\W_]{8,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
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

+(id)getFirstResponder{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponder = [keyWindow performSelector:@selector(firstResponder)];
    return firstResponder;
}

/**
 ** lineView:      需要绘制成虚线的view
 ** lineLength:    虚线的宽度 //2
 ** lineSpacing:        虚线的间距//1
 ** lineColor:    虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil ]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
    
}

+(void)touchFeedBack{
    if (@available(iOS 11.0, *)) {
        UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [feedBackGenertor impactOccurred];
    }
}


+(NSString *)removeWhiteSpaceAndNewlineChar:(NSString *)string{
    NSMutableString *mutStr = [NSMutableString stringWithString:string];
    NSRange range = {0,string.length};
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"\n"withString:@""options:NSLiteralSearch range:range2];
    return mutStr;
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

//// 密码校验
//+ (BOOL)isPassWord:(NSString *)str{
//    NSString *retxtpwd = @"^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*).{8}$";
//    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",retxtpwd];
//    return [pwdTest evaluateWithObject:str];
//}

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

+(BOOL)isPureFloat:(NSString *)string{

    NSScanner* scan = [NSScanner scannerWithString:string];

    float val;

    return [scan scanFloat:&val] && [scan isAtEnd];

}

 

+(BOOL)isPureInt:(NSString *)string{

    NSScanner* scan = [NSScanner scannerWithString:string];

    int val;

    return [scan scanInt:&val] && [scan isAtEnd];

}

+(UIImage *)imageFromBase64String:(NSString *)str{
    NSString *imgStr = str;
    if ([str hasPrefix:@"data:image/png;base64,"]) {
        NSRange range = [imgStr rangeOfString:@"data:image/png;base64,"];
        imgStr = [imgStr substringFromIndex:range.length];
    }
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:imgStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:imageData];
}

//处理特殊字符
+ (NSString *)turnURLChineseChar:(NSString *)str {
   NSString *newString = str;
   //遍历字符串中的字符
   for(int i=0; i< [str length];i++){
       int a = [str characterAtIndex:i];
       //汉字的处理
       if( a > 0x4e00 && a < 0x9fff)
       {
           NSString *oldString = [str substringWithRange:NSMakeRange(i, 1)];
           NSString *string = [oldString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
           newString = [newString stringByReplacingOccurrencesOfString:oldString withString:string];
       }
       //空格处理
       if ([newString containsString:@" "]) {
           newString = [newString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

       }
     //如果需要处理其它特殊字符,在这里继续判断处理即可.
   }
   return newString;
}

//判断是否大写
+(BOOL)onlyInputACapital:(NSString*)string {
    NSString *regex =@"[A-Z]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL inputString = [predicate evaluateWithObject:string];
    return inputString;
}
//验证车牌号是否正确
+(BOOL)checkCarID:(NSString *)carID {
    NSString *carRegex = @"^[测京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{5}[A-Z0-9挂警学台港澳]{1}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    BOOL isFit = [carTest evaluateWithObject:carID];

    NSString *carRegex1 = @"^[测京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂警学台港澳]{1}$";
    NSPredicate *carTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex1];
    BOOL isFit1 = [carTest1 evaluateWithObject:carID];


    NSString *carRegex2 = @"^[货]{1}[A-Z0-9]{1,10}$";
    NSPredicate *carTest2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex2];
    BOOL isFit2 = [carTest2 evaluateWithObject:carID];


    return isFit || isFit1 || isFit2;
    
}
//验证纳税人识别号
+ (BOOL)validateTaxpayerNumber:(NSString*)TaxpayerNumber {
    if (TaxpayerNumber.length==15 || TaxpayerNumber.length==18 ||TaxpayerNumber.length==20) {
        NSString *regex = @"[A-Z0-9]*|[A-Z]*|[0-9]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        return [pred evaluateWithObject:TaxpayerNumber];
    } else {
        return NO;
    }
}

+(BOOL)validateIDCardNumber:(NSString *)value {
    
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger length =0;
    if (!value) {
        return NO;
    }else {
        length = value.length;
        //不满足15位和18位，即身份证错误
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray = @[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    // 检测省份身份行政区代码
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO; //标识省份代码是否正确
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return NO;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    //分为15位、18位身份证进行校验
    switch (length) {
        case 15:
            //获取年份对应的数字
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                //创建正则表达式 NSRegularExpressionCaseInsensitive：不区分字母大小写的模式
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            //使用正则表达式匹配字符串 NSMatchingReportProgress:找到最长的匹配字符串后调用block回调
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                //1：校验码的计算方法 身份证号码17位数分别乘以不同的系数。从第一位到第十七位的系数分别为：7－9－10－5－8－4－2－1－6－3－7－9－10－5－8－4－2。将这17位数字和系数相乘的结果相加。
                
                int S = [value substringWithRange:NSMakeRange(0,1)].intValue*7 + [value substringWithRange:NSMakeRange(10,1)].intValue *7 + [value substringWithRange:NSMakeRange(1,1)].intValue*9 + [value substringWithRange:NSMakeRange(11,1)].intValue *9 + [value substringWithRange:NSMakeRange(2,1)].intValue*10 + [value substringWithRange:NSMakeRange(12,1)].intValue *10 + [value substringWithRange:NSMakeRange(3,1)].intValue*5 + [value substringWithRange:NSMakeRange(13,1)].intValue *5 + [value substringWithRange:NSMakeRange(4,1)].intValue*8 + [value substringWithRange:NSMakeRange(14,1)].intValue *8 + [value substringWithRange:NSMakeRange(5,1)].intValue*4 + [value substringWithRange:NSMakeRange(15,1)].intValue *4 + [value substringWithRange:NSMakeRange(6,1)].intValue*2 + [value substringWithRange:NSMakeRange(16,1)].intValue *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                
                //2：用加出来和除以11，看余数是多少？余数只可能有0－1－2－3－4－5－6－7－8－9－10这11个数字
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 3：获取校验位
                
                NSString *lastStr = [value substringWithRange:NSMakeRange(17,1)];
                
                NSLog(@"%@",M);
                NSLog(@"%@",[value substringWithRange:NSMakeRange(17,1)]);
                //4：检测ID的校验位
                if ([lastStr isEqualToString:@"x"]) {
                    if ([M isEqualToString:@"X"]) {
                        return YES;
                    }else{
                        return NO;
                    }
                }else{
                    if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                        return YES;
                    }else {
                        return NO;
                    }
                }
            }else {
                return NO;
            }
        default:
            return NO;
    }
}

+(BOOL)judgeVIN:(NSString *)str
{
    if (!str || str.length != 17) {
        return NO;
    }
    if ([str containsString:@"I"]||[str containsString:@"O"]||[str containsString:@"Q"])
    {
        return NO;
    }
    
    return YES;
}

@end
