//
//  UIColor+Hex.m
//  BBTransproter
//
//  Created by 李勇 on 2019/3/18.
//  Copyright © 2019年 BB. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor*)colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (UIColor*)randomColor
{
    return [UIColor colorWithRed:(arc4random()%255)*1.0f/255.0
                           green:(arc4random()%255)*1.0f/255.0
                            blue:(arc4random()%255)*1.0f/255.0 alpha:1.0];
}

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1 Case:1];
            green = [self colorComponentFrom: colorString start: 1 length: 1 Case:2];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1 Case:3];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1 Case:0];
            red   = [self colorComponentFrom: colorString start: 1 length: 1 Case:1];
            green = [self colorComponentFrom: colorString start: 2 length: 1 Case:2];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1 Case:3];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2 Case:1];
            green = [self colorComponentFrom: colorString start: 2 length: 2 Case:2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2 Case:3];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2 Case:0];
            red   = [self colorComponentFrom: colorString start: 2 length: 2 Case:1];
            green = [self colorComponentFrom: colorString start: 4 length: 2 Case:2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2 Case:3];
            break;
        default:
            return nil;
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length Case:(int) ARGB{
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    switch (ARGB) {
        case 0://alpha
            return hexComponent / 255.0;
            
            break;
        case 1://red
            
            return ( hexComponent )/ 255.0;
            
            break;
        case 2://green
            return (hexComponent)/ 255.0;
            
            break;
        case 3://blue
            return (hexComponent) / 255.0;
            
            break;
        default:
            break;
    }
    return 0;
}

@end


@implementation NSString (NSString_URLEncode)

- (NSString *)urlencode {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    int sourceLen = (int)strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

@end
