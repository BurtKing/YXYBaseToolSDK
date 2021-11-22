//
//  YXYHeader.h
//  YXYBaseToolSDK_Example
//
//  Created by 李勇 on 2021/11/19.
//  Copyright © 2021 amosYin. All rights reserved.
//

#ifndef YXYHeader_h
#define YXYHeader_h

#import "BBUtils.h"
#import "NSMutableDictionary+HandleException.h"
#import "NSString+LY.h"
#import "UIBarButtonItem+Extention.h"
#import "UIButton+EnlargeTouchArea.h"
#import "UIColor+Hex.h"
#import "UIImage+PicRotation.h"
#import "UITextView+Placeholder.h"
#import "UIView+Extension.h"

#ifdef DEBUG
#define kDeviceUuidString @"FE6ACD4B-7697-4E21-AE5B-5B9C78FE41DA"
#else
#define kDeviceUuidString     [[UIDevice currentDevice] identifierForVendor].UUIDString
#endif

#define OBJ_KEY_USERDEFAULTS(...) [[NSUserDefaults standardUserDefaults] objectForKey:(__VA_ARGS__)]
#define RESET_OBJ_KEY_USERDEFAULTS(obj,key) [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key]

#define KTextIp @"https://wl-test.bangbangas.com"
#define KUatIp @"https://wl-uat.bangbangas.com"
#define KStoreIp @"https://wl.bangbangas.com"
#define KLocalIp @"本地联调地址IP"
#define KAddress @"/bbdwl/carrier/app/api/open/"
#define KTakeorderAddress @"/bbdwl/shipper/h5/app"
#define KURLTEXT OBJ_KEY_USERDEFAULTS(@"url")
#define KTAKEORDER OBJ_KEY_USERDEFAULTS(@"takeorder")

#define ThemeDarkColor HexRGB(0x13AE67)
#define ThemeLightColor HexRGB(0x90c320)
#define THREECOLOR HexRGB(0x333333)
#define SIXCOLOR HexRGB(0x666666)
#define NINECOLOR HexRGB(0x999999)

#pragma mark - @name userdefault 相关key
///=============================================================================
#define kCOMMENLYUSED @"COMMENLYUSED"
#define kTOKEN @"kBBTOKEN"
#define kName @"kName"
#define kPass @"kPass"
#define kStationInfo @"kStationInfo"
#define kUserId @"userId"
#define kCarrier_category @"carrier_category"//01：普通承运商  02：开放平台对接承运商 03 代发承运商 04 系统对接承运商
///=============================================================================

#pragma mark - @name 尺寸相关
///=============================================================================
//屏幕宽高
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
// 判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
// 判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//状态栏高度
#define Height_StatusBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 44.0 : 20.0)
//导航栏高度
#define Height_NavBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 88.0 : 64.0)
//tabBar高度
#define Height_TabBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 83.0 : 49.0)
//安全区高度
#define SAFEAREAHEIGHT ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 34 : 0)
//以iPhone6为标准的宽度尺寸比例
#define kScreenWidthScal(w)     SCREEN_WIDTH/375.00*w
#define kScreenHeightScal(h)     SCREEN_HEIGHT/750.00*h

#define kScaleX  [UIScreen mainScreen].bounds.size.width / 375.f
///=============================================================================


#pragma mark - @name 提示
///=============================================================================
#define YBAlertShow(messageText,buttonName) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:(messageText) \
delegate:nil cancelButtonTitle:(buttonName) otherButtonTitles: nil];\
[alert show];
///=============================================================================


#pragma mark - @name 判断数据是否为空
///=============================================================================
//字符串是否为空
#define kISNullString(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kISNullArray(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 ||[array isEqual:[NSNull null]])
//字典是否为空
#define kISNullDict(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || [dic isEqual:[NSNull null]])
//是否是空对象
#define kISNullObject(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
//判断对象是否为空,为空则返回默认值
#define D_StringFix(_value,_default) ([_value isKindOfClass:[NSNull class]] || !_value || _value == nil || [_value isEqualToString:@"(null)"] || [_value isEqualToString:@"<null>"] || [_value isEqualToString:@""] || [_value length] == 0)?_default:_value
///=============================================================================


#pragma mark - @name app版本号
///=============================================================================
#define DEVICE_APP_VERSION      (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
// app Build版本号
#define DEVICE_APP_BUILD        (NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// 系统版本号（string）
#define DEVICE_OS_VERSION       [[UIDevice currentDevice] systemVersion]
// 系统版本号（float）
#define DEVICE_OS_VERSION_VALUE [DEVICE_OS_VERSION floatValue]
///=============================================================================


#pragma mark - @name 系统对象 等等
///=============================================================================
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
//#define kAppDelegate        ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
///=============================================================================


#pragma mark - @name 路径相关
///=============================================================================
//获取沙盒 temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//Library/Caches 文件路径
#define kFilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])
///=============================================================================


#pragma mark - @name 字体、颜色相关
///=============================================================================
#define FONT_SIZE(f)            [UIFont systemFontOfSize:(f)]
#define FONT_BOLD_SIZE(f)       [UIFont boldSystemFontOfSize:(f)]
#define FONT_ITALIC_SIZE(f)     [UIFont italicSystemFontOfSize:(f)]
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
#define RandomColor             [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define ColorWithHex(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBWithAlpha(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]
#define THREECOLOR HexRGB(0x333333)
#define SIXCOLOR HexRGB(0x666666)
#define NINECOLOR HexRGB(0x999999)
///=============================================================================



#pragma mark - @name 时间
///=============================================================================
//获得当前的年份
#define  kCurrentYear [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]]
//获得当前的月份
#define  kCurrentMonth [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]]
//获得当前的日期
#define  kCurrentDay  [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate date]]
//获得当前的小时
#define  kCurrentHour [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]]
//获得当前的分
#define  kCurrentMin [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:[NSDate date]]
//获得当前的秒
#define  kCurrentSec [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]]
///=============================================================================


#pragma mark - @name 自定义log 可以输出所在的类名,方法名,位置(行数)*/
///=============================================================================
#define DEBUGGER 1 //上线版本屏蔽此宏
#ifdef DEBUGGER
#define BBLog(format, ...) NSLog((@"%s [Line %d] " format), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define BBLog(...);
#endif
///=============================================================================



#pragma mark - @name 简单调用
///=============================================================================
//加载图片
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
//弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type
//弱引用对象
#define WeakObj(o) __weak typeof(o) o##Weak = o;
//强引用
#define kStrongSelf(type)  __strong typeof(type) type = weak##type
//安全调用Block
#define kSafeBlock(blockName,...) ({!blockName ? nil : blockName(__VA_ARGS__);})
//加载xib
#define kLoadNib(nibName) [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]]
//字符串拼接
#define kStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
//属性快速声明（建议使用代码块）
#define kPropertyString(name) @property(nonatomic,copy)NSString *name
#define kPropertyStrong(type,name) @property(nonatomic,strong)type *name
#define kPropertyAssign(name) @property(nonatomic,assign)NSInteger name
// View 圆角和加边框
#define kViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]
// View 圆角
#define kViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]
//永久存储对象
#define kSetUserDefaults(object, key)                                                                                                 \
({                                                                                                                                             \
NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];                                                                         \
[defaults setObject:object forKey:key];                                                                                                    \
[defaults synchronize];                                                                                                                    \
})
//获取对象
#define kGetUserDefaults(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
//删除某一个对象
#define kRemoveUserDefaults(key)                                         \
({                                                                          \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];       \
[defaults removeObjectForKey:_key];                                     \
[defaults synchronize];                                                 \
})
//清除 NSUserDefaults 保存的所有数据
#define kRemoveAllUserDefaults  [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]]
///=============================================================================


#pragma mark - @name 键盘限制字母及数字所用宏
///=============================================================================
#define NUM @"0123456789"
#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
///=============================================================================
#endif /* YXYHeader_h */
