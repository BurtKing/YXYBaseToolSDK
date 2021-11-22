//
//  NSMutableDictionary+HandleException.m
//  BaseProject
//
//  Created by Burt on 2019/2/21.
//  Copyright © 2019 piccfs. All rights reserved.
//

#import "NSMutableDictionary+HandleException.h"

@implementation NSMutableDictionary (HandleException)

-(void)safeSetObject:(id)obj forKey:(NSString *)key {
    if (!key) {
        NSLog(@"key = nil");
        return;
    }
    if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
        NSLog(@"value = nil");
    }else{
        if ([self judgeNumWith:obj]) {
            if (strcmp([obj objCType], @encode(BOOL)) == 0) { // 布尔值
                NSLog(@"this is a bool");
            }else if (strcmp([obj objCType], @encode(int)) == 0) { // 布尔值
                NSLog(@"this is a int");
            }else if (strcmp([obj objCType], @encode(double)) == 0) { // 布尔值
                NSLog(@"this is a double");
            }else if (strcmp([obj objCType], @encode(float)) == 0) { // 布尔值
                NSLog(@"this is a float");
            }else{
                
            }
        }else{
            [self setObject:[NSString stringWithFormat:@"%@",obj] forKey:key];
        }
    }
}

-(BOOL)judgeNumWith:(id)obj {
    NSNumber *num = (NSNumber *)obj;
    int minThreshold = [num intValue];
    if ((int)minThreshold < 1 ) {
        NSLog(@"不是数字");
        return NO;
    }else{
        return YES;
    }
}


@end
