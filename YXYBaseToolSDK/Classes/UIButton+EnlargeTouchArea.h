//
//  UIButton+EnlargeTouchArea.h
//  扩大点击范围
//
//  Created by Amos on 2018/6/19.
//  Copyright © 2018年 Amos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EnlargeTouchArea)
@property(nonatomic,strong)NSIndexPath * cellIndex;

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

- (void)setEnlargeEdge:(CGFloat) size;
@end
