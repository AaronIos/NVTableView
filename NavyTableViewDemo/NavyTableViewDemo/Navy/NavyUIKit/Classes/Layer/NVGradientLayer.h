//
//  NVGradientLayer.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



/*!
 @class
 @abstract      渐变色的Layer，继承CALayer
 */
@interface NVGradientLayer : CALayer

/*!
 @property
 @abstract      设置渐变颜色的数组，上下渐变
 */
@property (nonatomic, strong, readonly) NSMutableArray* arrayColors;

/*!
 @function
 @abstract      添加一个颜色
 */
- (void) addColor:(UIColor*)color;
- (void) removeColors;
@end

