//
//  NSMutableDictionary+HandleException.h
//  BaseProject
//
//  Created by Burt on 2019/2/21.
//  Copyright © 2019 piccfs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (HandleException)
-(void)safeSetObject:(id)obj forKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
