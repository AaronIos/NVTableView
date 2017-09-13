//
//  UIImageView+CornerRadius.h
//  LBYunZhi
//
//  Created by Astraea尊 on 2017/9/12.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImageView (CornerRadius)

/*
 function
 brief      初始化  cornerRadius 设置圆角大小  rectCornerType 设置圆角方向
 return     <#return#>
 */


- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (void)nvCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (instancetype)initWithRoundingRectImageView;

/*
 function
 brief      生成圆形图片
 return     <#return#>
 */

- (void)nvCornerRadiusRoundingRect;


/*
 function
 brief      设置圆角边框
 return     <#return#>
 */


- (void)nvAttachBorderWidth:(CGFloat)width color:(UIColor *)color;

@end
