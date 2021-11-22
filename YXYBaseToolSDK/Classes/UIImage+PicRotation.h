//
//  UIImage+PicRotation.h
//  LossAssistant
//
//  Created by Burt on 2018/3/12.
//  Copyright © 2018年 com.uqiauto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PicRotation)

/**
 修正图片方向

 @param aImage 传入image
 @return 修正后传出image
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;
@end
